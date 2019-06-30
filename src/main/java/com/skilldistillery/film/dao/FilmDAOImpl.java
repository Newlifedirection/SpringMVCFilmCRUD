package com.skilldistillery.film.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public class FilmDAOImpl implements FilmDAO {

	private final String USERNAME = "student";
	private final String PASSWORD = "student";
	private static final String URL = "jdbc:mysql://localhost:3306/sdvid?useSSL=false";

	public FilmDAOImpl() throws ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
	}

	@Override
	public Film findFilmById(int filmId) throws SQLException {
		Film film = null;
		Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		String sql = "SELECT film.title, film.description, film.release_year, film.language_id, film.rental_duration, film.rental_rate, film.length, film.replacement_cost, film.rating, film.special_features, name FROM film JOIN film_category fc ON fc.film_id = film.id JOIN category cat ON fc.category_id = cat.id WHERE film.id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, filmId);
		ResultSet rs = pstmt.executeQuery();
		try {
			while (rs.next()) {
				String title = rs.getString(1);
				String desc = rs.getString(2);
				Integer releaseYear = rs.getInt(3);
				String langId = rs.getString(4);
				Integer rentDur = rs.getInt(5);
				Double rate = rs.getDouble(6);
				Integer length = rs.getInt(7);
				Double repCost = rs.getDouble(8);
				String rating = rs.getString(9);
				String features = rs.getString(10);
				String category = rs.getString(11);
				film = new Film(filmId, title, desc, releaseYear, langId, rentDur, rate, length, repCost, rating,
						features, null, category);
			}
		} catch (SQLException e) {
			processException(e);
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return film;
	}

	@Override
	public Actor findActorById(int actorId) throws SQLException {
		Actor actor = null;
		Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		String sql = "SELECT id, first_name, last_name FROM actor WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, actorId);
		ResultSet rs = pstmt.executeQuery();
		try {
			if (rs.next()) {
				actor = new Actor(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"));
				actor.setFilms(findFilmsByActorId(actorId));
				return actor;
			}
		} catch (SQLException e) {
			processException(e);
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return actor;
	}

	@Override
	public List<Film> findFilmsByActorId(int actorId) throws SQLException {
		List<Film> films = new ArrayList<>();
		Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		String sql = "SELECT id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features FROM film JOIN film_actor ON film.id = film_actor.film_id WHERE actor_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, actorId);
		ResultSet rs = pstmt.executeQuery();
		try {
			while (rs.next()) {
				int filmId = rs.getInt(1);
				String title = rs.getString(2);
				String desc = rs.getString(3);
				Integer releaseYear = rs.getInt(4);
				String langId = rs.getString(5);
				int rentDur = rs.getInt(6);
				double rate = rs.getDouble(7);
				int length = rs.getInt(8);
				double repCost = rs.getDouble(9);
				String rating = rs.getString(10);
				String features = rs.getString(11);

				Film film = new Film(filmId, title, desc, releaseYear, langId, rentDur, rate, length, repCost, rating,
						features, null, null);
				films.add(film);
				return films;
			}
		} catch (SQLException e) {
			processException(e);
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return films;
	}

	@Override
	public List<Actor> findActorsByFilmId(int filmId) throws SQLException {
		List<Actor> actors = new ArrayList<>();
		Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		String sql = "select actor.first_name, actor.last_name, film.title from actor join film_actor on actor.id = film_actor.actor_id join film on film.id = film_actor.film_id where film.id =?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, filmId);
		ResultSet rs = pstmt.executeQuery();
		try {
			while (rs.next()) {
				String firstName = rs.getString(1);
				String lastName = rs.getString(2);
				Actor actor = new Actor(filmId, firstName, lastName);
				actors.add(actor);
			}
		} catch (SQLException e) {
			processException(e);
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return actors;
	}

	@Override
	public List<Film> findFilmsByKeyword(String keyword) throws SQLException {
		List<Film> films = new ArrayList<>();
		Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		String sql = "SELECT id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features FROM film WHERE film.title LIKE ? OR film.description LIKE ?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%" + keyword + "%");
		pstmt.setString(2, "%" + keyword + "%");
		ResultSet rs = pstmt.executeQuery();
		try {
			while (rs.next()) {
				int filmId = rs.getInt(1);
				String title = rs.getString(2);
				String desc = rs.getString(3);
				Integer releaseYear = rs.getInt(4);
				String langId = rs.getString(5);
				int rentDur = rs.getInt(6);
				double rate = rs.getDouble(7);
				int length = rs.getInt(8);
				double repCost = rs.getDouble(9);
				String rating = rs.getString(10);
				String features = rs.getString(11);

				Film film = new Film(filmId, title, desc, releaseYear, langId, rentDur, rate, length, repCost, rating,
						features, null, null);
				films.add(film);
			}
		} catch (SQLException e) {
			processException(e);
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return films;
	}

	public static void processException(SQLException e) {
		System.err.println("Error message: " + e.getMessage());
		System.err.println("Error code: " + e.getErrorCode());
		System.err.println("SQL state: " + e.getSQLState());
	}

	@Override
	public int addFilm(Film f) throws SQLException {
		System.out.println(f);
		int returnedId = 0;
		String sql = "INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating) "
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		Connection conn = null;

		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn.setAutoCommit(false); // Start transaction
			PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, f.getTitle());
			pstmt.setString(2, f.getDescription());
			pstmt.setInt(3, f.getReleaseYear());
			pstmt.setString(4, f.getLanguageId());
			pstmt.setInt(5, f.getRentalDuration());
			pstmt.setDouble(6, f.getRentalRate());
			pstmt.setInt(7, f.getLength());
			pstmt.setDouble(8, f.getReplacementCost());
			pstmt.setString(9, f.getRating());

			int uc = pstmt.executeUpdate();
			ResultSet keys = pstmt.getGeneratedKeys();
			System.out.println(uc);

			while (keys.next()) {
				returnedId = keys.getInt(1);
				
			}
			sql = "INSERT INTO film_category (film_id, category_id) VALUES (?,1)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, returnedId);
			uc = pstmt.executeUpdate();
			System.out.println("inserted" + returnedId );
			System.out.println(uc);
			conn.commit();
		} catch (SQLException e) {
			conn.rollback();
			processException(e);
		}

		return returnedId;
	}

	@Override
	public Film updateFilm(Film f) throws SQLException {
		String sql = "UPDATE film SET title= ?, description= ?, release_year=?, language_id=?, rental_duration=?, rental_rate=?, length=?, replacement_cost=? where id=?";
		Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		PreparedStatement pstmt = conn.prepareStatement(sql);

		try {

			conn.setAutoCommit(false); // Start transaction
			pstmt.setString(1, f.getTitle());
			pstmt.setString(2, f.getDescription());
			pstmt.setInt(3, f.getReleaseYear());
			pstmt.setString(4, f.getLanguageId());
			pstmt.setInt(5, f.getRentalDuration());
			pstmt.setDouble(6, f.getRentalRate());
			pstmt.setInt(7, f.getLength());
			pstmt.setDouble(8, f.getReplacementCost());
			pstmt.setInt(9, f.getFilmId());
			System.out.println(pstmt);
			int uc = pstmt.executeUpdate();

			conn.commit();

		} catch (SQLException e) {
			System.out.println("Failed to Update");
			conn.rollback();
			processException(e);
		}
		return f;

	}

	@Override
	public int deleteFilm(Integer filmId) throws SQLException {
		String sql = "DELETE FROM film WHERE id=?";
		System.out.println(filmId);
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn.setAutoCommit(false); // Start transaction
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, filmId);
			int uc = pstmt.executeUpdate();
			conn.commit();
			return uc;
		} catch (SQLException e) {
			System.out.println("Delete Not Allowed");
			conn.rollback();
			processException(e);

		} finally {
			conn.close();
		}
		return filmId;
	}
}
