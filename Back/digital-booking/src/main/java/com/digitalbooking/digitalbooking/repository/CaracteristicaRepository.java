package com.digitalbooking.digitalbooking.repository;

import com.digitalbooking.digitalbooking.domain.Caracteristica;
import com.digitalbooking.digitalbooking.domain.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CaracteristicaRepository extends JpaRepository<Caracteristica, Long> {

}
