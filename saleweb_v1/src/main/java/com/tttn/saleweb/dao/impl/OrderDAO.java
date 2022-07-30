package com.tttn.saleweb.dao.impl;

import java.util.Collection;
import java.util.List;

import com.tttn.saleweb.dao.IOrderDAO;
import com.tttn.saleweb.dao.IOrderDetailDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tttn.saleweb.entity.Customer;
import com.tttn.saleweb.entity.Order;
import com.tttn.saleweb.entity.OrderDetail;
import com.tttn.saleweb.entity.Product;
import com.tttn.saleweb.service.impl.CartService;

@Repository
public class OrderDAO extends GeneralDAO<Order, Integer> implements IOrderDAO {

	@Autowired
	private IOrderDetailDAO dao;

	@Override
	public void create(Order o, CartService cart) {
		this.create(o);
		Collection<Product> items = cart.getItemsCart();
		items.forEach(p -> {
			OrderDetail detail = new OrderDetail();
			detail.setOrder(o);
			detail.setProduct(p);
			detail.setUnitPrice(p.getUnitPrice());
			detail.setDiscount(p.getDiscount());
			detail.setQuantity(p.getQuantity());
			dao.create(detail);
		});

	}

	@Override
	public List<Order> findByUser(Customer user) {
		String sql = "FROM Order o WHERE o.customer.id=?0 ORDER BY o.orderDate DESC";
		return this.getResultList(sql, user.getId());
	}

}
