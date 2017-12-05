
var/const/ENGSEC			=(1<<0)

var/const/CAPITÃO			=(1<<0)
var/const/HOS				=(1<<1)
var/const/DIRETOR			=(1<<2)
var/const/DETETIVE			=(1<<3)
var/const/OFICIAL			=(1<<4)
var/const/CHEFE  			=(1<<5)
var/const/ENGENHEIRO			=(1<<6)
var/const/ATMOSFÉRICOS			=(1<<7)
var/const/AI				=(1<<8)
var/const/CIBORGUE			=(1<<9)
var/const/CENTCOM			=(1<<10)

var/const/MEDSCI			=(1<<1)

var/const/RD				=(1<<0)
var/const/CIENTISTA			=(1<<1)
var/const/QUÍMICO			=(1<<2)
var/const/CMO				=(1<<3)
var/const/DOUTOR			=(1<<4)
var/const/GENETICISTA		=(1<<5)
var/const/VIROLOGISTA		=(1<<6)
var/const/PSIQUIATRA		=(1<<7)
var/const/ROBOTICISTA		=(1<<8)
var/const/PARAMEDICO			=(1<<9)
var/const/LEGISTA			=(1<<10)


var/const/SUPORTE			=(1<<2)

var/const/HOP				=(1<<0)
var/const/GARÇON DE BAR			=(1<<1)
var/const/BOTANICO			=(1<<2)
var/const/CHEFE				=(1<<3)
var/const/FAXINEIRO			=(1<<4)
var/const/BIBLIOTECéRIO			=(1<<5)
var/const/CONTRAMESTRE		=(1<<6)
var/const/TECNICO DE CARGAS			=(1<<7)
var/const/MINERADOR 			=(1<<8)
var/const/ADVÓGADO			=(1<<9)
var/const/PADRE			=(1<<10)
var/const/PALHAÇO				=(1<<11)
var/const/MIMICO				=(1<<12)
var/const/CIVIL			=(1<<13)


var/const/KARMA				=(1<<3)

var/const/NANO				=(1<<0)
var/const/BLUESHIELD		=(1<<1)
var/const/BARBEIRO			=(1<<3)
var/const/MECHANIC			=(1<<4)
var/const/BRIGDOC			=(1<<5)
var/const/JUIZ				=(1<<6)
var/const/PILOTO				=(1<<7)

var/list/assistant_occupations = list(
)

var/list/command_positions = list(
	"Capitão",
	"Chefe Pessoal",
	"Chefe da Segurança",
	"Engenheiro Chefe",
	"Diretor de Pesquisa",
	"Chefe Medico"
)

var/list/engineering_positions = list(
	"Engenheiro Chefe",
	"Enhenheiro",
	"Especialista em apoio à vida",
	"Mecanico"
)


var/list/medical_positions = list(
	"Chefe Medico",
	"Doutor Medico",
	"Geneticista",
	"Psiquiatra",
	"Quimico",
	"Virologista",
	"Paramedico",
	"Legista"
)


var/list/science_positions = list(
	"Diretor de Pesquisa",
	"Cientista",
	"Geneticista",	//Part of both medical and science
	"Roboticista",
)

//BS12 EDIT
var/list/support_positions = list(
	"Chefe Pessoal",
	"Garçon do Bar",
	"Botanico",
	"Chefe",
	"Faxineiro",
	"Bibliotecário",
	"Quartermaster",
	"Tecnico de Carga",
	"Minerador",
	"Agente de assuntos internos",
	"Padre",
	"Palhaço",
	"Mimico",
	"Barbeiro",
	"Magistrado",
	"Representante da Nanotrasen",
	"Blueshield"
)

var/list/supply_positions = list(
	"Chefe Pessoal",
	"Quartermaster",
	"Tecnico de Cargas",
	"Minerador"
)

var/list/service_positions = support_positions - supply_positions + list("Chefe Pessoal")


var/list/security_positions = list(
	"Chefe da Segurança",
	"Diretor",
	"Detetive",
	"Oficial de Segurança",
	"Medico da Segurança",
	"Piloto de Pod da Segurança"
)


var/list/civilian_positions = list(
	"Civil"
)

var/list/nonhuman_positions = list(
	"AI",
	"Ciborgue",
	"Drone",
	"pAI"
)

var/list/whitelisted_positions = list(
	"Blueshield",
	"Representante da Nanotrasen",
	"Barbeiro",
	"Mecanico",
	"Medico da Segurança",
	"Magistrado",
	"Piloto de Pod da Segurança",
)


/proc/guest_jobbans(var/job)
	return (job in whitelisted_positions)

/proc/get_job_datums()
	var/list/occupations = list()
	var/list/all_jobs = typesof(/datum/job)

	for(var/A in all_jobs)
		var/datum/job/job = new A()
		if(!job)	continue
		occupations += job

	return occupations

/proc/get_alternate_titles(var/job)
	var/list/jobs = get_job_datums()
	var/list/titles = list()

	for(var/datum/job/J in jobs)
		if(!J)	continuar
		if(J.title == job)
			title = J.alt_title

	return titles

var/global/list/exp_jobsmap = list(
	EXP_TYPE_LIVING = list(), // Todos animais vivos
	EXP_TYPE_CREW = list(titles = Posições_do_comando | posições_da_engenharia | posições_da_medicina | posições_da_ciencia | posições_de_suporte | posições_de_abastecedores | posições_da_segurança | posições_de_civil | lista("AI","Ciborgue") | whitelisted_positions), // posições da tripulação
	EXP_TYPE_SPECIAL = list(), // Vilões, ERT, etc
	EXP_TYPE_GHOST = list(), // pessoas mortas, observadores
	EXP_TYPE_EXEMPT = list() // configuração especial do avô
)
