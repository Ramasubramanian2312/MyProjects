package edu.neu.cs5200.project.dao;


import java.util.List;



import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

import edu.neu.cs5200.project.models.Wishlist;

@Path("/wishlist")
public class WishlistDao {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("StocKart");
    EntityManager em = factory.createEntityManager();
    
    public void createWishlistItem(Wishlist wl) {        
        em.getTransaction().begin();
        em.persist(wl);
        em.getTransaction().commit();    
	}
    
    
	//removeCartItem
	@DELETE
	@Path("/{id}")
	public void removeWishlistItem(@PathParam("id") String itemId)
	{
		em.getTransaction().begin();
		Wishlist wl = em.find(Wishlist.class, itemId);
		System.out.println(wl.getName());
		em.remove(wl);
		em.getTransaction().commit(); 
	}
	
    
    public Wishlist findWishlist(String itemId)
    {
            return em.find(Wishlist.class, itemId);
    }
    
    public int findNoOfItems(String username)
    {		
    		Query query = em.createQuery("Select w from Wishlist w where w.customerId = :username");
    		query.setParameter("username", username);
            return query.getResultList().size();
    }
    
    public List<Wishlist> findAllItems(String username)
    {		
    		Query query = em.createQuery("Select w from Wishlist w where w.customerId = :username");
    		query.setParameter("username", username);
            return (List<Wishlist>)query.getResultList();
    }
    

	public WishlistDao() {
		super();
    }

	public static void main(String[] args) {
		WishlistDao w = new WishlistDao();

	}
}

