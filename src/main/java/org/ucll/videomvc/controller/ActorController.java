package org.ucll.videomvc.controller;

import domain.Movie;
import domain.facade.PersonBeheer;
import domain.facade.VideoBeheer;
import domain.factory.DatabaseType;
import domain.person.GenderPerson;
import domain.person.Person;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by filip on 17/04/2016.
 */
@Controller
@RequestMapping("/actors/*")
public class ActorController {

    @Autowired
    MessageSource messageSource;

    @Autowired
    private PersonBeheer pdbDao;

    @Autowired
    private VideoBeheer vdbDao;

    //private PersonBeheer pdbDao = new PersonBeheer(DatabaseType.RELATIONAL);
    //private VideoBeheer vdbDao = new VideoBeheer(DatabaseType.RELATIONAL);

    public List<Person> populateDBActors() {

        List<Person> actorList = new ArrayList<Person>();

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

        Person actor3 = new Person();
        actor3.setId(3);
        actor3.setName("Scarlett");
        actor3.setFamilyName("Johansson");
        actor3.setGender(GenderPerson.FEMALE);
        actor3.setJaarGeboorte(1984);
        actor3.setMaandGeboorte(11);
        actor3.setDagGeboorte(22);

        actorList.add(actor1);
        actorList.add(actor2);
        actorList.add(actor3);

        return actorList;

    }

    @RequestMapping(value = "/showactors")
    public String showactors(Model model) {

        List<Person> actors = pdbDao.getAllActors();
        actors.addAll(populateDBActors());

        model.addAttribute("name", "Hello Movies!");
        model.addAttribute("greetings", "Show all movies please!");
        model.addAttribute("actors", actors);

        return "crud/actors/showactors";
    }

    //Go to the addMovie form
    @RequestMapping(value = "/addActor", method = RequestMethod.GET)
    public ModelAndView addActor() {

        ModelAndView modelAndView = new ModelAndView("crud/actors/create");
        modelAndView.addObject("person", new Person());
        modelAndView.addObject("enumValuesGender", GenderPerson.values());
        return modelAndView;
    }

    //add the new made movie to the database
    @RequestMapping(value = "/process", method = RequestMethod.POST)
    public /*String*/ ModelAndView saveActorToDatabase(@ModelAttribute("person") @Valid Person person,
                                                       BindingResult result,
                                                       ModelMap modelMap,
                                                       Model model/*,
                                                       @RequestParam("date") LocalDate date*/
    ) {

        ModelAndView modelAndView;

        if (result.hasErrors()) {
            //ModelAndView object aanmaken
            //ModelAndView.addObject("errors",result.getAllErrors());
            modelAndView = new ModelAndView("crud/actors/create");
            modelAndView.addObject("errors", result.getAllErrors());
            modelAndView.addObject("person", person);
            return modelAndView;
            //return "crud/actors/create";
        }

        //System.out.println("Date of Birth:"+ actor.getDob());


        pdbDao.addActor(person);
        modelMap.addAttribute("person", person);

        modelAndView = new ModelAndView("crud/actors/detailactor");
        modelAndView.addObject("person", person);
        return modelAndView;
        //return "crud/actors/detailactor";

    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));

    }

    @RequestMapping(path = "/getmovie/{id}", value = "/getmovie/{id}", method = RequestMethod.GET)
    public ModelAndView showMovieWithActors(@PathVariable("id") int id, Model model) {

        Movie movie = vdbDao.getMovieById(id);

        List<Person> persons = pdbDao.getAllActorsFromOneMovie(id);

        ModelAndView modelAndView = new ModelAndView("crud/movies/showmovieandactors");
        modelAndView.addObject("movie", movie);
        modelAndView.addObject("persons", persons);

        return modelAndView;


    }


}
