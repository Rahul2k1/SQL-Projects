Select * from CovidDeaths
where continent is not null
order by 3,4

--Percentage of Population that contracted Covid
Select location, date, population, total_cases, (total_cases/population)*100 
as PercentagePopulation from CovidDeaths
where location like '%states%'
order by 1,2

--Countries with highest infection rate compared to population

Select location, population, MAX(total_cases) as highestinfCount, MAX((total_cases/population))*100 
as PercentagePopulationinfected from CovidDeaths
where location like '%states%'
group by Location, Population
order by PercentagePopulationinfected desc


--Showing countries with highest death count per population
Select location, MAX(cast(Total_deaths as int)) AS TotalDeathCount from CovidDeaths
--where location like '%states%'
where continent is not null
group by Location
order by TotalDeathCount desc

--BREAKING THINGS DOWN BY CONTINENT

--Showing the continents with the highest death count per population
Select continent, MAX(cast(Total_deaths as int)) AS TotalDeathCount from CovidDeaths
--where location like '%states%'
where continent is not null
group by continent
order by TotalDeathCount desc


--Global Count
Select sum(new_cases) as totalnewcases, sum(cast(new_deaths as int)) as totnewdeaths 
, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from CovidDeaths
where continent is not null
--group by date
order by 1,2


--Looking at Total Population vs Vaccinations
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (Partition by dea.location order by dea.location,
dea.date) as RollcountVaccinated
from CovidDeaths dea
join CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2, 3 


--USING CTE

With POPvsVAC (Continent, Location, Date, Population, new_vaccinations, RollcountVaccinated)
as
(

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (Partition by dea.location order by dea.location,
dea.date) as RollcountVaccinated
from CovidDeaths dea
join CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
--order by 2, 3 
)
Select *, (RollcountVaccinated/Population)*100 as VaccinPerc
from POPvsVAC


--TEMP TABLE

DROP table if exists #PercentPopulationVaccinated
Create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollcountVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (Partition by dea.location order by dea.location,
dea.date) as RollcountVaccinated
from CovidDeaths dea
join CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
--where dea.continent is not null
--order by 2, 3 

Select *, (RollcountVaccinated/population)*100
from #PercentPopulationVaccinated



--View to store data for visualisations

Create view PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (Partition by dea.location order by dea.location,
dea.date) as RollcountVaccinated
from CovidDeaths dea
join CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
--order by 2, 3 

Select * from PercentPopulationVaccinated