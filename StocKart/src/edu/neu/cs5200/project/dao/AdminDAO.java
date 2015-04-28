package edu.neu.cs5200.project.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import edu.neu.cs5200.project.models.Adminbean;

public class AdminDAO 
{
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("StocKart");
	EntityManager em = factory.createEntityManager();
	
	public Adminbean getUname (Adminbean upk)
	{
		Adminbean up = em.find(Adminbean.class, upk.getUsername());
		if (up!= null)
		{
			return up;
		}
		return null;
	}
		
	public Adminbean login (Adminbean user)
	{
		Adminbean ub = em.find(Adminbean.class, user.getUsername());
		if(ub!= null)
		{
			if(ub.getPassword().equals(user.getPassword()))
			{
				return ub;
			}
		}
		return null;		
	}

	public AdminDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
