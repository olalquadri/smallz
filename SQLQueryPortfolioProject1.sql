
/*

Select *
From PortfolioProject..CovidDeaths
where continent is not null
order by 3,4

Select *
From PortfolioProject..CovidVaccinations
order by 3,4

*/

Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

 -- Looking at total cases versus total deaths 
 -- showing the likelihood of dying if one contracted Covid in Canada
  
 /*

Challenge = unable to get result when qurerying for #victims 
error = Operand data type varchar is invalid for divide operator
resolution -->used CAST to chnage the character types of the total_deaths and total_cases.

*/

Select Location, date, total_cases, total_deaths, (Cast (total_deaths as decimal) /cast (total_cases as decimal))*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where location like '%Canada%'
and continent is not null
order by 1,2

-- Looking at the total cases versus population  
-- shows what percentage of population got Covid

Select Location, date, total_cases, population, (Cast (total_cases as decimal) /cast (population as decimal))*100 as ContractCovidPercentage
From PortfolioProject..CovidDeaths
where continent is not null
-- where location like '%Canada%'
order by 1,2

-- Looking at country with highest ib=nfection rate to population  

Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentagePopulationInfected
From PortfolioProject..CovidDeaths
where continent is not null
group by Location, population
order by PercentagePopulationInfected desc 


-- showing counties with Highrest death count per population 

Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
where continent is not null
group by Location
order by TotalDeathCount desc

--more correct below

Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
where continent is null
group by Location
order by TotalDeathCount desc

-- LETS BREAK THINGS UP BY CONTINENT
-- showing the continients with the highest death count

-- YOU CAN DRILL DOWN BY ADDING CONTINIENT TO ALL PREVIOUS QUERIES 

Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
where continent is not null
group by continent
order by TotalDeathCount desc


-- GLOBAL NUMBERS

/*
-- wont work based on group by , need to use agreegate function 

Select date, total_cases, total_deaths, (Cast (total_deaths as decimal) /cast (total_cases as decimal))*100 as DeathPercentage
From PortfolioProject..CovidDeaths
-- where location like '%Canada%'
where continent is not null
Group by date
order by 1,2
*/


-- query bit working 
/*

-- looking at total cases per day accross the world in percentage.

Select date, sum(new_cases) as total_cases, Sum(new_deaths) as total_death, (sum(new_deaths) / sum(new_cases))*100 as GlobalDeathPercentage
From PortfolioProject..CovidDeaths
Group by date
order by 1,2
*/

-- looking at total cases per day accross the world.

Select date, sum(new_cases) as total_cases, Sum(new_deaths) as total_death
From PortfolioProject..CovidDeaths
where continent is not null
Group by date
order by 1,2

-- looking at total sum of cases versus total deatha and its percetage GLOBALY

Select sum(new_cases) as total_cases, Sum(new_deaths) as total_death, (sum(new_deaths) / sum(new_cases))*100 as GlobalDeathPercentage
From PortfolioProject..CovidDeaths
-- where location like '%Canada%'
where continent is not null
--Group by date
order by 1,2




/*

Select *
From PortfolioProject..CovidVaccinations
order by 3,4

*/


Select *
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date


-- Lookinf at total population versus vaccination 

Select dea.continent, dea.location,dea.date, vac.new_vaccinations
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3

-- Looking at total population versus vaccination rolling counts

/*
Challenge 3 = query result for large data type 
error = Arithmetic overflow error converting expression to data type int"
resolution -- vlanId column is to big for the datatype int (-2147483647 to 2147483647). Use bigInt.
*/

Select dea.continent, dea.location,dea.date, vac.new_vaccinations, 
Sum (Convert(bigint, vac.new_vaccinations)) over (partition by dea.location Order by dea.location,dea.date)as RollingPeopleVac
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3 


-- Looking at total population versus vaccination rolling counts
-- using CTE

with PopvsVac (Continent, Location, date, Population, new_vaccinations, RollingPeopleVac)
as
(
Select dea.continent, dea.location,dea.date, dea.population, vac.new_vaccinations, 
Sum (Convert(bigint, vac.new_vaccinations)) over (partition by dea.location Order by dea.location,dea.date)as RollingPeopleVac
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3 
)
Select *, RollingPeopleVac/Population *100
from PopvsVac


-- using TEMP TABLE
Drop Table if exists #PercentPopulationVac
Create Table #PercentPopulationVac
(
Continent nvarchar (255),
Location nvarchar (255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVac numeric
) 

Insert into #PercentPopulationVac
Select dea.continent, dea.location,dea.date, dea.population, vac.new_vaccinations, 
Sum (Convert(bigint, vac.new_vaccinations)) over (partition by dea.location Order by dea.location,dea.date)as RollingPeopleVac
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null
--order by 2,3 

Select *, RollingPeopleVac/Population *100
from #PercentPopulationVac


-- Creating VIEWS

Create view PercentPopulationVac as
Select dea.continent, dea.location,dea.date, dea.population, vac.new_vaccinations, 
Sum (Convert(bigint, vac.new_vaccinations)) over (partition by dea.location Order by dea.location,dea.date)as RollingPeopleVac
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null

Select * 
From PercentPopulationVac
