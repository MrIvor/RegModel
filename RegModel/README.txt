### Coperight
----------------
Autor: qingfeng sun
Mail: qf.sun@foxmail.com

### Requirements
----------------
* Perl 5.14+
    * Tool
        * Spreadsheet::Read
        * Spreadsheet::ParseExcel
        * Spreadsheet::XLSX
        * Template Toolkit 2
        
### Tool install
--------------------------
* change to root 
   su - 
* bring up CPAN tool
   perl -e shell -MCPAN
* change to Ali source
   o conf urllist push https://mirrors.aliyun.com/CPAN/
   o conf commit
* install module
   install Spreadsheet::Read
   install Spreadsheet::ParseExcel
   install Spreadsheet::XLSX
   install Template Toolkit 2
            
### Usage
----------------
source source_env
cd example
RegModel register_excel.xlsx


