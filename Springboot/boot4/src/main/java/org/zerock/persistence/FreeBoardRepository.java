package org.zerock.persistence;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.zerock.domain.FreeBoard;

public interface FreeBoardRepository extends CrudRepository<FreeBoard, Long> {
	
	public List<FreeBoard> findByBnoGreaterThan(Long bno, Pageable page);
}
