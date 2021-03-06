package com.upc.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.upc.entity.Respuesta;

@Repository
@Transactional
public interface RespuestaRepository extends CrudRepository<Respuesta, Integer>{

}
