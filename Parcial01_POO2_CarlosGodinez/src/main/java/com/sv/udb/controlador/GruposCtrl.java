/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.Grupos;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author Carlos
 */
public class GruposCtrl {
    public List<Grupos> ConsTodo()
    {
        List<Grupos> resp = new ArrayList<>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PARCIALPU");
        EntityManager em = emf.createEntityManager();
        try
        {
            TypedQuery<Grupos> query =em.createNamedQuery("Grupos.findAll", Grupos.class);
            resp = query.getResultList();
        }
        catch(Exception ex)
        {
            
        }
        return resp;
    }
}
