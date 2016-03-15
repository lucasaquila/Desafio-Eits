package br.com.projeto.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;

import br.com.projeto.entity.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long>{
	
	@Query("Select u from Usuario u where u.email = :email and situacao = true")
	Usuario finByEmail(@Param("email") String email);
	
	@Modifying(clearAutomatically = true)
	@Query("update Usuario u set u.situacao =:situacao where u.id =:id")
	void changeSituacao(@Param("situacao") Boolean situacao, @Param("id") Long id);
	
}
