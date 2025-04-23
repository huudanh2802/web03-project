package com.web03backend.controller;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web03backend.domain.NoteEntity;
import com.web03backend.dto.note.GetNoteDTO;
import com.web03backend.dto.note.NoteDTO;
import com.web03backend.dto.note.UpdateNoteDTO;
import com.web03backend.service.spec.INoteService;

@RestController
@RequestMapping("/api/note")
public class NoteController {
    @Autowired
    private INoteService noteService;

    @Autowired
    private ModelMapper modelMapper;

    @GetMapping
    public ResponseEntity<GetNoteDTO> findNotesByUserId(Long userId,
                                                        Pageable pageable,
                                                        @RequestParam(required = false)
                                                           String keyword) {
        Page<NoteEntity> notesPage = noteService.findByUserIdAndNoteContainingIgnoreCase(userId, keyword, pageable);
        List<NoteDTO> notes =notesPage.stream()
                .map(noteEntity -> modelMapper.map(noteEntity, NoteDTO.class))
                .collect(java.util.stream.Collectors.toList());
        GetNoteDTO res = new GetNoteDTO(notesPage.getTotalElements(),notes);
        return ResponseEntity.ok(res);
    }

    @PostMapping
    public ResponseEntity<NoteDTO> createEmptyNoteByUser(Long userId) {
        NoteDTO note = modelMapper.map(noteService.createNoteByUserId(userId), NoteDTO.class);
        return ResponseEntity.ok(note);
    }

    @PutMapping
    public ResponseEntity<NoteDTO> updateNote(@RequestBody UpdateNoteDTO noteDTO) {
        NoteDTO note = modelMapper.map(noteService.updateNote(noteDTO), NoteDTO.class);
        return ResponseEntity.ok(note);
    }

    @DeleteMapping
    public ResponseEntity<?> deleteNoteById(Long noteId) {
        noteService.deleteNoteById(noteId);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/all")
    public ResponseEntity<?> deleteAllNotesByUserId(@RequestParam Long userId) {
        noteService.deleteAllNotesByUserId(userId);
        return ResponseEntity.ok().build();
    }
}
