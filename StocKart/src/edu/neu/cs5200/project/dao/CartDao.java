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
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import edu.neu.cs5200.project.models.Cart;

@Path("/cart")
public class CartDao {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("StocKart");
    EntityManager em = factory.createEntityManager();
    
    public void createCartItem(Cart cart) {        
        em.getTransaction().begin();
        em.persist(cart);
        em.getTransaction().commit();    
	}
    
    @PUT
    @Path("/")
    @Consumes(MediaType.APPLICATION_JSON)
    public void updateQuantity(Cart cart){
    	System.out.println("In");
    	em.getTransaction().begin();
    	em.merge(cart);
    	em.getTransaction().commit();
    }
    
	//removeCartItem
	@DELETE
	@Path("/{id}")
	public void removeCartItem(@PathParam("id") String itemId)
	{
		em.getTransaction().begin();
		Cart cart = em.find(Cart.class, itemId);
		System.out.println(cart.getName());
		em.remove(cart);
		em.getTransaction().commit(); 
	}
    
    public Cart findCart(String itemId)
    {
            return em.find(Cart.class, itemId);
    }
    
    public int findNoOfItems(String username)
    {		
    		Query query = em.createQuery("Select c from Cart c where c.customerId = :username");
    		query.setParameter("username", username);
            return query.getResultList().size();
    }
    
    public List<Cart> findAllItems(String username)
    {		
    		Query query = em.createQuery("Select c from Cart c where c.customerId = :username");
    		query.setParameter("username", username);
            return (List<Cart>)query.getResultList();
    }
    
    public double findCartTotal(String username)
    {		
    		Query query = em.createQuery("Select (c.salePrice)*(c.quantity) from Cart c where c.customerId = :username");
    		query.setParameter("username", username);
            //return Math.round((double) query.getSingleResult());
    		double total=0;
    		List<Double> lst = (List<Double>)query.getResultList();
    		for(Double d:lst){
    			total+=d;
    		}
    		return Math.round(total);
    }

	public CartDao() {
		super();
    }

	public static void main(String[] args) {
		CartDao c = new CartDao();
		System.out.println(c.findAllItems("rama2312").get(0).getQuantity());
		System.out.println(c.findCartTotal("rama2312"));
	}
}
