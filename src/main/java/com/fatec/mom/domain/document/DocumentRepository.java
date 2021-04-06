package com.fatec.mom.domain.document;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DocumentRepository extends JpaRepository<Document, Long>, JpaSpecificationExecutor<Document> {

    @Override
    @EntityGraph(type = EntityGraph.EntityGraphType.FETCH, attributePaths = "blocks")
    List<Document> findAll();

    @EntityGraph(type = EntityGraph.EntityGraphType.FETCH, attributePaths = "blocks")
    List<Document> findAllByNameAndPartNumber(String name, Integer partNumber);

    @EntityGraph(type = EntityGraph.EntityGraphType.FETCH, attributePaths = "blocks")
    List<Document> findAllByNameAndPartNumberAndTrait(String name, Integer partNumber, Integer trait);
}