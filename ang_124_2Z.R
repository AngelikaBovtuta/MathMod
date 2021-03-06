## ������� ������� ����������� ���� �� �������� ������ 2013 ���� �� ������ ��������� ������� ������������ ���������
# �������� ������� ����������
getwd()


library("tidyverse")# �� ��� ����
library("readr")# ������� read_csv()
library("stringr")# ������� str_replace_all
���������� ("dplyr") # �������: Filter (), arrange (), select (), mutate (), summary (), group_by_n()
library("ggplot2")# ������� ������� qplot()

#��������� ����
eddypro  = ������.csv ("eddypro.csv", skip  =  1, na  = c ( "" , " NA " , "-9999" , "-9999.0" ), �����������  = c( " [ "))
#������� ������
# ������� �������� ������ ������ ������
eddypro  =  ������� [ - 1,]
# ������� �������� ������ ������� "roll"
eddypro  = select (eddypro, - (roll))
# ����������� � ������� (factor) ������ ���� char(������)
eddypro  =  eddypro % > > % mutate_if( is.��������, ������)
#������� ����������� ������� � �������� ������� �� ���������� ��� ���������� �����
����� (eddypro) = ����� (eddypro ) %>>%
 str_replace_all (" [!] ", "_exclam_") %>>%
 str_replace_all("[?] ", "_quest_") %>>% 
 str_replace_all ( " [ * ]", "_star") %>>% 
 str_replace_all ( " [ + ]", "_plus_") %>>%
 str_replace_all ( " [ - ]", "_minus_") %>>%
 str_replace_all ("[ @ ]", "_at_" ) %>>%
 str_replace_all ( " [ $ ]", "_dollar_") %>>%
 str_replace_all ( " [ # ]", "_hash_") %>>%
 str_replace_all ( " [ / ]", "_slash_") %>>%
 str_replace_all( "[%] " , " __pecent_") %>>%
 str_replace_all ( " [ & ]", "_amp_") %>>%
 str_replace_all( "[ \\ ^] " , "_power_") %>>%
 str_replace_all( "[()] " , " _ ")
#��������� ������� ������� � ���� �������� ��� ��������,���������
������ ������( eddypro)
#������ ������ � ������� ���������� NA
eddypro = drop_na(eddypro)
# ����������� �� ������� ������ ������ �� �������� ������. 
eddypro  = ������ (eddypro, DOY > > =  151  &  DOY <  242)
# ����������� ������ �� ������� ������ �� ������� �����
eddypro  = ������ (eddypro, �������  ����� = = TRUE)
# ������� �������, ��������� ������ �� ����� ��� ������ � ���
eddypro_numeric  =  eddypro [, sapply( eddypro, is.��������)]
# ������� �������, ���������� ��������� �������
eddypro_non_numeric  =  eddypro [,!sapply( eddypro, is.��������)]
# �������� ��������� � ����������� ���������������� ������� � ������� �������� �����������
row_numbers  =  1: ����� (eddypro_numeric $ co2_flux)
teach  = sample( row_numbers , floor(length( eddypro_numeric $ co2_flux))*.7))
test  =  row_numbers [- �����]
#��������� �������
teaching_tbl  =  eddypro_numeric [ �����,]
#����������� �������
testing_tbl  =  eddypro_numeric [ ����,]
# �������� ������ ������� � ��� ��� ���������� � ������� "(.)" � ��������� ��������� �������
mod  = lm (co2_flux~ (.), data  =  teaching_tbl)
