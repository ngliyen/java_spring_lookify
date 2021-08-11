package com.liyen.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.liyen.lookify.models.Song;
import com.liyen.lookify.services.SongService;

@Controller
public class SongController {
	private final SongService songService;
	
	public SongController(SongService songService) {
		this.songService = songService;
	}
	
	@RequestMapping("/")
	public String index() {
		return "/songs/index.jsp";
	}
	
	// shows all songs
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Song> songs = songService.allSongs();
		model.addAttribute("songs", songs);
		return "/songs/dashboard.jsp";
	}
	
	// page to add new song
	@RequestMapping("/songs/new")
	public String addBook(@ModelAttribute("song") Song song) {
		return "/songs/new.jsp";
	}
	
	// create a new song
	@RequestMapping(value="/songs", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		if (result.hasErrors()) {
			return "/songs/new.jsp";
		} else {
			Song newSong = songService.createSong(song);
			Long id = newSong.getId();
			return "redirect:/songs/" + id; // redirect to show page later
		}
	}
	
	// show song by id
	@RequestMapping("/songs/{id}")
	public String show(@PathVariable("id") Long id, Model model, RedirectAttributes redirectAttributes) {
		Song song = songService.findSong(id);
		if (song==null) {
			redirectAttributes.addFlashAttribute("error", "The song id you selected does not exist! Please select another id.");
			return "redirect:/dashboard";
		} else {
			model.addAttribute("song", song);
			return "/songs/show.jsp";
		}
	
	}
	
	// process the search term and redirect
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String search(@RequestParam(value="search") String search) {
		// if no search term given, redirect to dashboard which shows all songs
		if (search.isEmpty()) {
			return "redirect:/dashboard";
		}
		return "redirect:/search/" + search;
	}
	
	// search based on artist name
	@RequestMapping("/search/{name}")
	public String songsByArtist(@PathVariable("name") String name, Model model) {
		List<Song> songs = songService.displayByArtist(name);
		model.addAttribute("songs",songs);
		model.addAttribute("name",name);
		return "/songs/search.jsp";
	}
	
	// show songs with top 10 rating
	@RequestMapping("/search/topTen")
	public String showTopTen(Model model) {
		List<Song> songs = songService.showTopTenSongs();
		model.addAttribute("songs", songs);
		return "/songs/topTen.jsp";
 	}
	
	// delete a song by id
	@RequestMapping(value="/songs/{id}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Long id) {
		songService.deleteSong(id);
		return "redirect:/dashboard";
	}
	
	
	
}
