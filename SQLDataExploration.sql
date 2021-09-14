select Location, date, total_cases, new_cases, total_deaths, population
from CovidDeath
where continent is not null 
order by 1,2;

-- Looking at Total Cases vs Total Deaths
-- Shows what Percentage of population got Covid
select Location, date, total_cases, population, (total_cases/population)*100 as CasesPercentage
from CovidDeath
Where location like '%states%'
order by 1,2;

-- Showing Countries with the highest Death Count per Population:

select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
from CovidDeath
where continent is not null
Group by Location
order by TotalDeathCount desc;


-- Global Numbers:
  Select date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths,SUM(cast(new_deaths as int)) / SUM(New_Cases)*100 as DeathPercentage
  from CovidDeath
  where continent is not null
  Group by date
  order by 1,2

  -- Looking at Total Population vs Vaccination

  Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
  from CovidDeath dea
  Join CovidVaccination vac
  on dea.location = vac.location
  and dea.date = vac.date
  where dea.continent is not null
  order by 2,3