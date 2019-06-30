package com.skilldistillery.film.controllers;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.dao.FilmDAO;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO dao;

	public FilmDAO getDao() {
		return dao;
	}

	public void setDao(FilmDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping(path="GetFilmData.do",params="filmId", method=RequestMethod.GET)
	public ModelAndView getFilmById(@RequestParam(name = "filmId") int n) {
		ModelAndView mv = new ModelAndView();
		Film f;
		try {
			f = dao.findFilmById(n);
			mv.addObject("film", f);
			mv.setViewName("result");
		} catch (SQLException e) {
			mv.setViewName("error");
			e.printStackTrace();
		}
		return mv;
		
	}
	
	@RequestMapping(path="AddFilm.do", method=RequestMethod.POST)
	public ModelAndView addFilm(Film f) {
		ModelAndView mv = new ModelAndView();
		int newId;
		Film newFilm = null;
		try {
			newId = dao.addFilm(f);
			newFilm = dao.findFilmById(newId);
			mv.addObject("film", newFilm);
			mv.setViewName("result");
		} catch (SQLException e) {
			mv.setViewName("error");
			e.printStackTrace();
		}
		return mv;
		
	}
	@RequestMapping(path="updateFilm.do", method=RequestMethod.POST)
	public ModelAndView updateFilm(Film f) {
		ModelAndView mv = new ModelAndView();
		Film filmToEdit = null;
		try {
			filmToEdit = dao.updateFilm(f);
			mv.addObject("film", filmToEdit);
			mv.setViewName("result");
		} catch (SQLException e) {
			mv.setViewName("error");
			e.printStackTrace();
		}
		return mv;
		
	}
	
	@RequestMapping(path="updateFilm.do", method=RequestMethod.GET)
	public ModelAndView updateFilmPage(int filmId) {
		System.out.println(filmId);
		ModelAndView mv = new ModelAndView();
		Film filmToEdit = null;
		try {
			filmToEdit = dao.findFilmById(filmId);
			mv.addObject("film", filmToEdit);
			mv.setViewName("updatefilm");
		} catch (SQLException e) {
			mv.setViewName("error");
			e.printStackTrace();
		}
		return mv;
		
	}
	@RequestMapping(path="deleteFilm.do", method=RequestMethod.POST)
	public ModelAndView delete(Integer filmId) {
		ModelAndView mv = new ModelAndView();
		try {
			dao.deleteFilm(filmId);
			mv.setViewName("deletePage");
		} catch (SQLException e) {
			mv.setViewName("error");
			e.printStackTrace();
		}
		return mv;
		
	}
	
	@RequestMapping(path="searchFilm.do", method=RequestMethod.GET)
	public ModelAndView search() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("search");
		return mv;
		
	}
	@RequestMapping(path = "SearchResults.do",params = "keyword", method = RequestMethod.GET)
	public ModelAndView findByKeyword(@RequestParam(name = "keyword") String kw) {
		ModelAndView mv = new ModelAndView();
		try {
			List<Film> films = dao.findFilmsByKeyword(kw);
			mv.addObject("films", films);
			mv.setViewName("searchResults");
		} catch (SQLException e) {
			mv.setViewName("error");
			e.printStackTrace();
		}
		return mv;
	}
}
