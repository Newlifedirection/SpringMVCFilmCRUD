package com.skilldistillery.film.controllers;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping(path="GetFilmData.do",params="filmId")
	public ModelAndView getFilmById(@RequestParam(name = "filmId") int n) {
		ModelAndView mv = new ModelAndView();
		Film f;
		try {
			f = dao.findFilmById(n);
			mv.addObject("film", f);
			mv.setViewName("WEB-INF/film.jsp");
		} catch (SQLException e) {
			mv.setViewName("WEB-INF/error.jsp");
	
			e.printStackTrace();
		}
		return mv;
		
	}
}
