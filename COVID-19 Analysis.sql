select * from projectportfolio.coviddeaths 
order by 3, 4;

select * from projectportfolio.covidvaccinations
order by 3, 4;

select location, date, total_cases, new_cases, total_deaths, population
from projectportfolio.coviddeaths
order by 1, 2;

select location, date, total_cases, total_deaths, (total_deaths / total_cases) * 100 as DeathPercentage
from projectportfolio.coviddeaths
where location like '%%'
order by 1, 2;

select location, population, Max(total_cases) as HighestInfection, 
(Max(total_cases) / population) * 100 as DeathPercentage
from projectportfolio.coviddeaths
group by location, population
order by HighestInfection desc;

select location, population, Max(total_cases) as HighestInfection, 
(Max(total_cases) / population) * 100 as PercentageInfected
from projectportfolio.coviddeaths
group by location, population;

select continent, Max(total_deaths) as TotalDeathCount
from projectportfolio.coviddeaths
where continent is not null group by continent
order by TotalDeathCount desc;


select sum(new_cases) as total_cases, sum(new_deaths)  as total_deaths, sum(new_deaths) / sum(new_cases) * 100 as DeathPercentage 
from projectportfolio.coviddeaths
where continent is not null 
order by 1, 2;

select death.continent, death.location, death.date, death.population, vaccine.new_vaccinations
from projectportfolio.coviddeaths death
join projectportfolio.covidvaccinations vaccine
on death.location = vaccine.location
and death.date = vaccine.date
where death.continent is not null
order by 1, 2, 3;

select death.continent, death.location, death.date, death.population, vaccine.new_vaccinations
from projectportfolio.coviddeaths death
join projectportfolio.covidvaccinations vaccine
on death.location = vaccine.location
and death.date = vaccine.date
where death.continent is not null
order by 1, 2, 3;