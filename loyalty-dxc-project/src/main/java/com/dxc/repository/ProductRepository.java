package com.dxc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.transaction.annotation.Transactional;

import com.dxc.entity.Product;

@RepositoryRestResource
@Transactional
public interface ProductRepository  extends CrudRepository<Product,Long>{
  List<Product> findAll();
  Product findByProdid(int id);
  @Modifying(clearAutomatically = true)
  @Transactional
  @Query("update Product product set product.name =:isProdName,product.price=:isPrice,product.point=:isPoint where product.prodid =:isProdID")
 public  void updateProduct(@Param("isProdID") int isProdID, @Param("isProdName") String isProdName , @Param("isPrice") long isPrice, @Param("isPoint") int isPoint);
}