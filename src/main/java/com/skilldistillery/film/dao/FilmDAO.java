package com.skilldistillery.film.dao;

import java.sql.SQLException;
import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public interface FilmDAO {
	
	public Film findFilmById(int filmId) throws SQLException;

	public Actor findActorById(int actorId) throws SQLException;

	public List<Actor> findActorsByFilmId(int filmId) throws SQLException;
	
	public List<Film> findFilmsByActorId(int actorId) throws SQLException;
	
	public List<Film> findFilmsByKeyword(String keyword) throws SQLException;
	
	public int addFilm(Film f) throws SQLException;
	
	public Film updateFilm(Film f) throws SQLException;
	
	public int deleteFilm(Integer filmId) throws SQLException;
	
	public Film findFilmCategories(Film f) throws SQLException;


}
