package org.ucll.videomvc.controller;

import domain.Movie;
import domain.facade.VideoBeheer;
import domain.factory.DatabaseType;
import domain.person.GenderPerson;
import domain.person.Person;
import helperclasses.MovieEvaluation;
import helperclasses.MovieGenre;
import helperclasses.MovieRating;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import restful.TheMVDB;

import javax.validation.Valid;
import java.util.*;

/**
 * Created by filip on 17/04/2016.
 */
@Controller
@RequestMapping("/movies/*")
public class MovieController {

    @Autowired
    MessageSource messageSource;

    @Autowired
    private VideoBeheer vdbDao;

    //private VideoBeheerRelationalDatabase vdbDao = new VideoBeheerRelationalDatabase();
    //private VideoBeheer vdbDao = new VideoBeheer(DatabaseType.RELATIONAL);


    public ArrayList<Movie> populateDBMovies() {

        ArrayList<Movie> movieList = new ArrayList<Movie>();

        Movie movie1 = new Movie();
        movie1.setId(1);
        movie1.setTitle("The Lord of the Rings: The Fellowship of the Ring");
        movie1.setDirector("Peter Jackson");
        movie1.setJaar(2001);
        movie1.setGenre(MovieGenre.FANTASY);
        movie1.setRating(MovieRating.GENERALAUDIENCE);
        movie1.setEvaluation(MovieEvaluation.FIVESTARS);
        movie1.setSeen(true);
        movie1.setThemoviedbid("120");

        Movie movie2 = new Movie();
        movie2.setId(2);
        movie2.setTitle("The Lord of the Rings: The Two Towers");
        movie2.setDirector("Peter Jackson");
        movie2.setJaar(2002);
        movie2.setGenre(MovieGenre.FANTASY);
        movie2.setRating(MovieRating.PGTHIRTEEN);
        movie2.setEvaluation(MovieEvaluation.FOURSTARS);
        movie2.setSeen(true);
        movie2.setThemoviedbid("121");

        Movie movie3 = new Movie();
        movie3.setId(3);
        movie3.setTitle("The Lord of the Rings: The Return of the King");
        movie3.setDirector("Peter Jackson");
        movie3.setJaar(2003);
        movie3.setGenre(MovieGenre.FANTASY);
        movie3.setRating(MovieRating.PGTHIRTEEN);
        movie3.setEvaluation(MovieEvaluation.FIVESTARS);
        movie3.setSeen(true);
        movie3.setThemoviedbid("122");

        movieList.add(movie1);
        movieList.add(movie2);
        movieList.add(movie3);

        return movieList;
    }

    @RequestMapping(value = "/showmovies")
    public String showmovies(Model model) {

        List<Movie> movies = vdbDao.getAllMovies();
        movies.addAll(populateDBMovies());
        int jaarfilmgezien = 0;
        Map<Integer, Integer> aantalfilmsgezienperjaar = new TreeMap<Integer, Integer>();

        for (Movie m : movies) {
            if (m.isSeen()) {
                Integer temp = aantalfilmsgezienperjaar.get(m.getJaar());
                if (temp == null)
                    temp = 1;
                aantalfilmsgezienperjaar.put(m.getJaar(), temp++);
            }
        }

        RestTemplate restTemplate = new RestTemplate();
        TheMVDB themvdbclass = restTemplate.getForObject("https://api.themoviedb.org/3/movie/49051?api_key=feb28e437be8a3b0b90f44da4bc93644", TheMVDB.class);

        System.out.println("classmvdb = " + themvdbclass.getRuntime());
        System.out.println(themvdbclass.toString());

        Map<Movie,TheMVDB> moviesrest = new HashMap<Movie, TheMVDB>();

        for (Movie mm : movies) {

            TheMVDB theMVDB = restTemplate.getForObject("https://api.themoviedb.org/3/movie/" +
                    mm.getThemoviedbid() + "?api_key=feb28e437be8a3b0b90f44da4bc93644", TheMVDB.class);

            moviesrest.put(mm, theMVDB);

        }

        model.addAttribute("name", "Hello Movies!");
        model.addAttribute("greetings", "Show all movies please!");
        model.addAttribute("movies", movies);
        model.addAttribute("aantalfilmsgezienperjaar", aantalfilmsgezienperjaar);
        model.addAttribute("moviesrest",moviesrest);

        return "crud/movies/showmovies";
    }

    public List<Integer> makeYearsForForm() {
        List<Integer> jaartallen = new ArrayList<Integer>();

        int beginjaartal = 1986;
        jaartallen.add(beginjaartal);

        for (int i = 0; i < 30; i++) {
            beginjaartal = beginjaartal + 1;
            jaartallen.add(beginjaartal);
        }

        return jaartallen;
    }

    // Go to the addMovie form
    @RequestMapping(value = "/addMovie", method = RequestMethod.GET)
    public ModelAndView addMovie() {

        // List<Integer> jaartallen = makeYearsForForm();

        List<Integer> jaartallen = new ArrayList<Integer>();

        int beginjaartal = 1986;
        jaartallen.add(beginjaartal);

        for (int i = 0; i < 30; i++) {
            beginjaartal = beginjaartal + 1;
            jaartallen.add(beginjaartal);
        }

        List<Person> actors = new ArrayList<Person>();

        Person actor1 = new Person();
        actor1.setId(1);
        actor1.setName("Hugh");
        actor1.setFamilyName("Jackman");
        actor1.setGender(GenderPerson.MALE);
        actor1.setJaarGeboorte(1968);
        actor1.setMaandGeboorte(10);
        actor1.setDagGeboorte(12);

        Person actor2 = new Person();
        actor2.setId(2);
        actor2.setName("Christian");
        actor2.setFamilyName("Bale");
        actor2.setGender(GenderPerson.MALE);
        actor2.setJaarGeboorte(1974);
        actor2.setMaandGeboorte(1);
        actor2.setDagGeboorte(30);

        actors.add(actor1);
        actors.add(actor2);

        ModelAndView modelAndView = new ModelAndView("crud/movies/create");
        modelAndView.addObject("movie", new Movie());
        modelAndView.addObject("enumValuesGenre", MovieGenre.values());
        modelAndView.addObject("enumValuesRating", MovieRating.values());
        modelAndView.addObject("enumValuesEvaluation", MovieEvaluation.values());
        modelAndView.addObject("jaartallen", jaartallen);
        modelAndView.addObject("actors", actors);

        return modelAndView;
    }

    public List<Integer> genereerJaartallen() {
        List<Integer> jaartallen = new ArrayList<Integer>();

        int beginjaartal = 1986;
        jaartallen.add(beginjaartal);

        for (int i = 0; i < 30; i++) {
            beginjaartal = beginjaartal + 1;
            jaartallen.add(beginjaartal);
        }
        return jaartallen;
    }

    // add the new made movie to the database
    @RequestMapping(value = "/process", method = RequestMethod.POST)
    public /* String */ ModelAndView saveMovieToDatabase(@ModelAttribute("movie") @Valid Movie movie,
                                                         BindingResult result, ModelMap modelMap, Model model) {

        ModelAndView modelAndView;

        if (result.hasErrors()) {
            // List<Integer> jaartallen = new ArrayList<Integer>();
            List<Integer> jaartallen = genereerJaartallen();

            int beginjaartal = 1986;
            jaartallen.add(beginjaartal);

            for (int i = 0; i < 30; i++) {
                beginjaartal = beginjaartal + 1;
                jaartallen.add(beginjaartal);
            }

            // ModelAndView object aanmaken
            // ModelAndView.addObject("errors",result.getAllErrors());
            modelAndView = new ModelAndView("crud/movies/create");
            modelAndView.addObject("errors", result.getAllErrors());
            modelAndView.addObject("movie", movie);
            modelAndView.addObject("enumValuesGenre", MovieGenre.values());
            modelAndView.addObject("enumValuesRating", MovieRating.values());
            modelAndView.addObject("enumValuesEvaluation", MovieEvaluation.values());
            modelAndView.addObject("jaartallen", jaartallen);
            return modelAndView;
            // return "crud/movies/create";
        }

        vdbDao.addMovie(movie);
        modelMap.addAttribute("movie", movie);

        modelAndView = new ModelAndView("crud/movies/detailmovie");
        modelAndView.addObject("movie", movie);
        return modelAndView;
        // return "crud/movies/detailmovie";
    }

    // show updateForm of chosen Movie By Id
    @RequestMapping(path = "/update/{id}", value = "/update/{id}", method = RequestMethod.GET)
    public String updateMovie(@PathVariable("id") int id, Model model) {
        Movie movie = vdbDao.getMovieById(id);

        model.addAttribute("movie", movie);
        return "crud/movies/update";
    }

    // update the movie to the database
    @RequestMapping(value = "/updatemovie", method = RequestMethod.POST)
    public String updateMovieToDatabase(@ModelAttribute("movie") Movie movie, BindingResult result, ModelMap modelMap,
                                        Model model) {
        // vdb.updateMovie(movie, movie.getId());
        vdbDao.updateMovie(movie);
        return "redirect:/movies/showmovies.htm";
    }

    @RequestMapping(path = "/delete/{id}", value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteMovie(@PathVariable("id") int id, Model model) {
        vdbDao.deleteMovieById(id);
        return "redirect:/movies/showmovies.htm";
    }

    //nog niet geimplementeerd
    @RequestMapping(path = "/getmovie/{id}", value = "/getmovie/{id}", method = RequestMethod.GET)
    public ModelAndView showMovieWithActors(@PathVariable("id") int id, Model model) {


        //List<Person> persons = vdbDao.getMovieAndActors();

        ModelAndView modelAndView = new ModelAndView("crud/movies/showmovieandactors");



        return modelAndView;


    }

}