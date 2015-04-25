package edu.neu.cs5200.project.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.project.models.Myreview;


public class ReviewDAO {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("StocKart");
	EntityManager em = factory.createEntityManager();
		
	public void createReview (Myreview review)
	{
		em.getTransaction().begin();
		em.persist(review);
		em.getTransaction().commit();
	}	
		
	public List<Myreview> findAllReviewsforItem(Integer itemid)
    {		
    		Query query = em.createQuery("Select r from Myreview r where r.itemId = :itemid ORDER BY r.submissionTime,r.reviewId DESC");
    		query.setParameter("itemid", itemid);
            return  (List<Myreview>)query.getResultList();
    }

	
	/*public static void main(String[] args) {
		
		ReviewDAO rdao = new ReviewDAO();
		List<Myreview> myrev = new ArrayList<Myreview>();
		
		myrev = rdao.findAllReviewsforItem(30135922);
		
		System.out.println (myrev.get(0).getReviewText());
	
	}*/
	
}
