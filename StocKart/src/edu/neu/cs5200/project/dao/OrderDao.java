package edu.neu.cs5200.project.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;

import edu.neu.cs5200.project.models.Order;
import edu.neu.cs5200.project.models.Orderdetail;
import edu.neu.cs5200.project.models.Payment;
import edu.neu.cs5200.project.models.Userbean;

@Path("/order")
public class OrderDao {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("StocKart");
    EntityManager em = factory.createEntityManager();
    
    
    //add an order
    @PUT
    @Path("/")
    public void createOrder(Order order) {        
        em.getTransaction().begin();
        em.persist(order);
        em.getTransaction().commit();    
	}
    
	public int addOrderdetail(int orderId, Orderdetail detail)
	{
		em.getTransaction().begin();
		Order order = em.find(Order.class, orderId);
		detail.setOrder(order);
		order.getOrderdetails().add(detail);
		em.merge(order);
		em.flush();
		em.getTransaction().commit();
		return order.getOrderdetails().get(0).getOrderDetailId();
		
	}
	
	public void addPayment(int orderId, Payment payment)
	{
		em.getTransaction().begin();
		Order order = em.find(Order.class, orderId);
		payment.setOrder(order);
		order.setPayment(payment);
		em.merge(order);
		em.getTransaction().commit();
		
	}
    
 /*   @PUT
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
    }*/

	public OrderDao() {
		super();
    }

	public static void main(String[] args) {
		OrderDao c = new OrderDao();
	}
}

