package edu.neu.cs5200.project.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.project.models.Cart;
import edu.neu.cs5200.project.models.Custinfo;
import edu.neu.cs5200.project.models.Order;
import edu.neu.cs5200.project.models.Orderdetail;
import edu.neu.cs5200.project.models.Userbean;


public class UserDAO 
{
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("StocKart");
	EntityManager em = factory.createEntityManager();
	
	public Userbean getUname (Userbean upk)
	{
		Userbean up = em.find(Userbean.class, upk.getUsername());
		if (up!= null)
		{
			return up;
		}
		return null;
	}
		
	public List<Userbean> getAllUsers()
	{
		Query query = em.createQuery("Select u from Userbean u");
        return (List<Userbean>)query.getResultList();
		
	}
	
	public void removeUser(String username)
	{
		em.getTransaction().begin();
		Userbean user = em.find(Userbean.class, username);
		em.remove(user);
		em.getTransaction().commit();
	}
	
	public Userbean login (Userbean user)
	{
		Userbean ub = em.find(Userbean.class, user.getUsername());
		if(ub!= null)
		{
			if(ub.getPassword().equals(user.getPassword()))
			{
				return ub;
			}
		}
		return null;		
	}
	
	public void signup (Userbean user)
	{
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
	}
	
	public int addOrder(String username, Order order)
	{
		em.getTransaction().begin();
		Userbean user = em.find(Userbean.class, username);
		order.setUserbean(user);
		user.getOrders().add(order);
		em.merge(user);
		em.flush();
		em.getTransaction().commit();
		return user.getOrders().get(user.getOrders().size()-1).getOrderId();
		
	}
	
	public void addCustInfo(String username, Custinfo info)
	{
		em.getTransaction().begin();
		Userbean user = em.find(Userbean.class, username);
		info.setUserbean(user);
		user.setCustinfo(info);;
		em.merge(user);
		em.getTransaction().commit();
		
	}
	

	public static void main(String[] args) {
		UserDAO dao = new UserDAO();
/*		Custinfo info = new Custinfo("rama2312","Rama","new","male","address1",null);
		dao.addCustInfo("rama2312", info);*/
		
	/*	dao.getOrders("rama2312");*/	
	}
}
