--create table Public."adidas"(index int, url varchar(250), name varchar(100), sku varchar(50), selling_price int, original_price varchar(50), currency char(10), availaibility char(50), color char(20), category char(50), source_ char(100), source_website varchar(100), breadcrumbs char(100), description varchar(2000), brand char(50), images varchar(1000), language_ char(10), average_rating numeric(2,1), reviews_count int)


--select * from adidas

--select count(*) from adidas

--select name , url from adidas
--group by name, url
--having name = 'Beach Shorts'

--select count(*) from adidas
--where name = 'Essentials Loose Logo Tank Top'

--select count(*) from adidas
--where url like '%shoes%'

--select url, name, sku from adidas
--group by url, sku, name
--having url like '%shoes%'
--and sku like 'G%'

--select * from adidas
--where selling_price > 40

--select * from adidas
--where selling_price between 40 and 100

--select name, selling_price, original_price
--from adidas
--group by selling_price, name, original_price
--having selling_price between 40 and 80
--and original_price = '$100'

--select * from adidas
--where name like '%shoes%'
--order by selling_price

--select distinct(original_price), name, color from adidas
--where color = 'Black'
--and original_price > '$50'
--order by original_price desc
--limit 10

--select name, selling_price, category from adidas
--where color = 'White'
--group by category, name, selling_price
--having category = 'Clothing'
--and selling_price between 40 and 70
--order by selling_price

--select name, max(selling_price) as Max_SP, category, breadcrumbs from adidas
--group by category, breadcrumbs,selling_price, name
--having category = 'Clothing'
--and breadcrumbs = 'Men/Clothing'
--limit 1

--select count(name), avg(average_rating) from adidas
--where color = 'Black'

--select count(name), avg(average_rating) from adidas
--where color in ('White','Black')

--select distinct(count(category)), avg(reviews_count) from adidas
--where category = 'Shoes'
--and reviews_count > 100

--select category, avg(reviews_count), color from adidas
--group by color, category, reviews_count
--having category = 'Clothing'
--and reviews_count > 100
--limit 10