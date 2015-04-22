package edu.neu.cs5200.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

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

}
