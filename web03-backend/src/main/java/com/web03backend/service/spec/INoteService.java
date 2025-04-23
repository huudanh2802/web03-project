package com.web03backend.service.spec;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.web03backend.domain.NoteEntity;
import com.web03backend.dto.note.UpdateNoteDTO;

public interface INoteService {
    Page<NoteEntity> findByUserIdAndNoteContainingIgnoreCase(Long userId, String keyword, Pageable pageable);

    NoteEntity createNoteByUserId(Long userId);
    NoteEntity updateNote(UpdateNoteDTO noteDTO);

    void deleteNoteById(Long noteId);
    
    void deleteAllNotesByUserId(Long userId);
}
