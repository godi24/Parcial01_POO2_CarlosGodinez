/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.Alumnos;
import com.sv.udb.modelo.GruposAlumnos;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author Carlos
 */
public class GruposAlumnosCtrl {
    public boolean guar(GruposAlumnos obje)
    {
        boolean resp = false;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PARCIALPU");
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        try
        {
            em.persist(obje);
            tx.commit();
            resp = true;
        }
        catch(Exception ex)
        {
            tx.rollback();
        }
        em.close();
        emf.close();
        return resp;
    }
    
    public List<GruposAlumnos> ConsTodo(Object Codi)
    {
        if(Codi == null){
            Codi = 1;
        }
        List<GruposAlumnos> resp = new ArrayList<>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PARCIALPU");
        EntityManager em = emf.createEntityManager();
        try
        {
            TypedQuery<GruposAlumnos> query =em.createNamedQuery("GruposAlumnos.findByCodiGrup", GruposAlumnos.class);
            query.setParameter("codiGrup",Codi);
           resp = query.getResultList();
        }
        catch(Exception ex)
        {
            
        }
        em.close();
        emf.close();
        return resp;
       
    }
    
    public Alumnos cons(Long codiAlum)
    {
        Alumnos resp = null;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PARCIALPU");
        EntityManager em = emf.createEntityManager();
        try
        {
            resp = em.find(Alumnos.class, codiAlum);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            em.close();
            emf.close();            
        }
        return resp;
    }
}
