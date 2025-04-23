package com.web03backend.repositories.spec;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.web03backend.domain.NoteEntity;

public interface INoteRepository extends JpaRepository<NoteEntity, Long> {
    Page<NoteEntity> findByUserId(Long userId, Pageable pageable);

    Page<NoteEntity> findByUserIdAndNoteContainingIgnoreCase(Long userId, String note, Pageable pageable);
    
    void deleteByUserId(Long userId);
}
