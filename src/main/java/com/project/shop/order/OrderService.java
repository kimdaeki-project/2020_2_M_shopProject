package com.project.shop.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.cart.CartDAO;
import com.project.shop.cart.CartDTO;
import com.project.shop.member.MemberDAO;
import com.project.shop.member.MemberDTO;
import com.project.shop.util.OrderPager;

@Service
@Transactional(rollbackFor = Exception.class)
public class OrderService {
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private CartDAO cartDAO;
	
	public int setOrderDelete(OrderDTO orderDTO)throws Exception{
		return orderDAO.setOrderDelete(orderDTO);
	}
	
	public OrderDTO getOrderOne(OrderDTO orderDTO)throws Exception{
		return orderDAO.getOrderOne(orderDTO);
	}
	
	public int setOrderAddressFixUpdate(OrderDTO orderDTO)throws Exception{
		return orderDAO.setOrderAddressFixUpdate(orderDTO);
	}
	
	public int setOrderAddressUpdate(OrderDTO orderDTO)throws Exception{
		return orderDAO.setOrderAddressUpdate(orderDTO);
	}
	
	public OrderDTO getOrderAddressOne(OrderDTO orderDTO)throws Exception{
		
		return orderDAO.getOrderAddressOne(orderDTO);
	}
	
	public int setOrderAddressDelete(OrderDTO orderDTO)throws Exception{
		return orderDAO.setOrderAddressDelete(orderDTO);
	}
	
	public List<OrderDTO> getOrderAddress(OrderDTO orderDTO)throws Exception{
		return orderDAO.getOrderAddress(orderDTO);
	}
	
	public int setOrderStatusUpdate(OrderDTO orderDTO)throws Exception{
		return orderDAO.setOrderStatusUpdate(orderDTO);
	}
	
	
	public List<CartDTO> getOrderList(String[]arr) throws Exception{
		List<CartDTO> cartDTOs = new ArrayList<CartDTO>();
		
			for (int i=0 ;i<arr.length; i++) {
				 CartDTO cartDTO = new CartDTO();
				 cartDTO.setNum(Long.parseLong(arr[i]));
				 cartDTOs.add(orderDAO.getOne(cartDTO));
			}
		
	
		return cartDTOs;
		
	}
	
	public int setOrderInsert(OrderDTO orderDTO,long[] productNum,long[] price, long[] amount, 
			String[] color,String[]sizing,
			MemberDTO memberDTO,long []cartNum)throws Exception{
		//주문 테이블에 데이터 넣음
		int result= orderDAO.setOrderInsert(orderDTO);
		
		//주문테이블에 주문데이터 넣은후 배송지목록에 추가할지 말지 결정함
		//중복되어있으면 추가하지않음
		OrderDTO check =orderDAO.getOrderAddressCheck(orderDTO);
		long count=0;
		//중복이안되어있다면 해당 회원의 배송지 목록개수를 가져옴 최대 5개임
		if(check==null) {
			count = orderDAO.getOrderAddressCount(orderDTO);
			//5개 미만이면 중복검사를 마쳤으므로 배송지목록에추가함
			if(count<5) {
				result=orderDAO.setDestInsert(orderDTO);
			}else {
				//5개이상이면 가장 오래된 기록중 고정이 되어있지않은 배송지를 지워야함
				int data = orderDAO.setOrderAddressFixDelete(orderDTO);
				//지운것이 없다면 5개배송지 전부가 고정되어있으므로 배송지를 추가하지않음
				//지운것이 있다면 4개가 되었으므로 주문페이지에서 작성한 배송지를 배송지테이블에추가함
				if(data>0) {
					result=orderDAO.setDestInsert(orderDTO);
				}
			}
		}else {
			//중복되어있으면 해당 배송지의 시퀀스를 최신값으로 변경하여 가장 먼저 나오게함
			result=orderDAO.setOrderAddressSequenceUpdate(check);
		}
		//주문 상품내역에 데이터 삽입
		String orderNum=orderDTO.getNum();
		for(int i=0;i<productNum.length;i++) {
			OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
			orderDetailDTO.setOrderNum(orderNum);
			orderDetailDTO.setProductNum(productNum[i]);
			orderDetailDTO.setPrice(price[i]);
			orderDetailDTO.setColor(color[i]);
			orderDetailDTO.setSizing(sizing[i]);	
			orderDetailDTO.setAmount(amount[i]);
			result+=orderDAO.setOrderDetail(orderDetailDTO);
		}
		//사용한 적립금만큼 차감후 세션의 값도 갈아줌
		if(result>0) {
			result=memberDAO.setPointUpdate(orderDTO);
			memberDTO.setPoint(memberDTO.getPoint()-orderDTO.getPoint());
			//장바구니에서 결제한 내역지움
			for(int i=0; i<cartNum.length;i++) {
				if(cartNum[i]>0) {
					CartDTO cartDTO = new CartDTO();
					cartDTO.setNum(cartNum[i]);
				result+=cartDAO.setDelete(cartDTO);
				}
				
				
			}
		}
		return result;
	}
	

	
	
	public List<OrderDTO> getOrderList(OrderPager pager)throws Exception{
		pager.makeRow();
		pager.setTotalCount(orderDAO.getOrderCount(pager));
		pager.makePage();
		
		List<OrderDTO> orderDTOs= orderDAO.getOrderList(pager);
		for(int i=0;i<orderDTOs.size();i++) {
			OrderDTO orderDTO = new OrderDTO();
			orderDTO.setNum(orderDTOs.get(i).getNum());
			orderDTOs.get(i).setProductDTOs(orderDAO.getOrderDetailList(orderDTO));
			
		}
		
		return orderDTOs;
	}
	
	public OrderDTO getSelect(OrderDTO orderDTO)throws Exception{
		return orderDAO.getSelect(orderDTO);
	}
	
	public OrderDTO getOrderAddressCheck(OrderDTO check)throws Exception{
		return orderDAO.getOrderAddressCheck(check);
	}
	public int setDestInsert(OrderDTO orderDTO) throws Exception{
		return orderDAO.setDestInsert(orderDTO);
	}
}
