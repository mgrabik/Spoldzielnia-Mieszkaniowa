package bdbt_gra_projS;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AppControler {

	@Autowired
	private PracownicyDAO dao;
	@Autowired
	private RachunkiDAO daor;
	@Autowired
	private WynagrodzeniaDAO daow;

	@RequestMapping("/")
	public String viewHomePage(Model model) {
		
		return "firstpage";
	}
	
	@RequestMapping("/menu")
	public String viewMenuPage(Model model) {
		
		return "menu";
	}
	
	@RequestMapping("/login_admin?uname=admin&pwd=admin")
	public String viewMenuPage1(Model model) {
		
		return "menu";
	}
	
	@RequestMapping("/login_admin")
	public String viewHomePagelogin(Model model) {
		
		return "login";
	}
	
	@RequestMapping("/employees")
	public String showPracownicy(Model model) {
		List<Pracownicy> listPracownicy = dao.list();
		model.addAttribute("listPracownicy", listPracownicy);
		return "employees";
	}
	
	@RequestMapping("/Salary")
	public String showWynagrodzenia(Model model) {
		List<Wynagrodzenia> listWynagrodzenia = daow.list();
		model.addAttribute("listWynagrodzenia", listWynagrodzenia);
		return "Salary";
	}

	@RequestMapping("/Bills")
	public String showbills(Model model) {
		List<Rachunki> listRachunki = daor.list();
		model.addAttribute("listRachunki", listRachunki);
		return "Bills";
	}
	
	@RequestMapping("/Bills/resident")
	public String showbillsresident(Model model) {
		List<Rachunki> list_resident = daor.list_resident();
		model.addAttribute("list_resident", list_resident);
		return "Bills_residents";
	}

	@RequestMapping("/new")
	public String showNewForm(Model model) {
		Pracownicy pracownicy = new Pracownicy();
		model.addAttribute("Pracownicy", pracownicy);

		return "new_form";
	}
	
	@RequestMapping("/Bills/new")
	public String showNewFormBills(Model model) {
		Rachunki rachunki = new Rachunki();
		model.addAttribute("Rachunki", rachunki);

		return "new_Bill";
	}
	
	@RequestMapping("/Salary/new")
	public String showNewFormSalary(Model model) {
		Wynagrodzenia wynagrodzenia = new Wynagrodzenia();
		model.addAttribute("Wynagrodzenia", wynagrodzenia);

		return "new_Salary";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("pracownicy") Pracownicy pracownicy) {
		dao.save(pracownicy);

		return "redirect:/employees";
	}
	
	@RequestMapping(value = "/saveSalary", method = RequestMethod.POST)
	public String saveSalary(@ModelAttribute("wynagrodzenia") Wynagrodzenia wynagrodzenia) {
		daow.save(wynagrodzenia);

		return "redirect:/Salary";
	}
	
	@RequestMapping(value = "/Bills/Bills/save", method = RequestMethod.POST)
	public String saveBill(@ModelAttribute("rachunki") Rachunki rachunki) {
		daor.save(rachunki);

		return "redirect:/Bills";
	}

	@RequestMapping("/edit/{id}")
	public ModelAndView showEditForm(@PathVariable(name = "id") int id) {
		ModelAndView mav = new ModelAndView("edit_form");
		Pracownicy pracownicy = dao.get(id);
		mav.addObject("pracownicy", pracownicy);

		return mav;
	}

	@RequestMapping("/Bills/edit/{id}")
	public ModelAndView showEditFormBills(@PathVariable(name = "id") int id) {
		ModelAndView mav = new ModelAndView("Bills_edit");
		Rachunki rachunki = daor.get(id);
		mav.addObject("rachunki", rachunki);

		return mav;
	}
	
	@RequestMapping("/Salary/edit/{id}")
	public ModelAndView showEditFormSalary(@PathVariable(name = "id") int id) {
		ModelAndView mav = new ModelAndView("Salary_edit");
		Wynagrodzenia wynagrodzenia = daow.get(id);
		mav.addObject("wynagrodzenia", wynagrodzenia);

		return mav;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute("Pracownicy") Pracownicy pracownicy) {
		dao.update(pracownicy);

		return "redirect:/employees";
	}
	
	@RequestMapping(value = "/updateSalary", method = RequestMethod.POST)
	public String updateSalary(@ModelAttribute("Wynagrodzenia") Wynagrodzenia wynagrodzenia) {
		daow.update(wynagrodzenia);

		return "redirect:/Salary";
	}
	
	@RequestMapping(value = "/Bills/edit/Bills/update", method = RequestMethod.POST)
	public String updateBills(@ModelAttribute("Rachunki") Rachunki rachunki) {
		daor.update(rachunki);

		return "redirect:/Bills";
	}

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable(name = "id") int id) {
		dao.delete(id);
		return "redirect:/employees";
	}

	@RequestMapping("Bills/delete/{id}")
	public String deleteBills(@PathVariable(name = "id") int id) {
		daor.delete(id);
		return "redirect:/Bills";
	}
	
	@RequestMapping("Salary/delete/{id}")
	public String deleteSalary(@PathVariable(name = "id") int id) {
		daow.delete(id);
		return "redirect:/Salary";
	}

}
