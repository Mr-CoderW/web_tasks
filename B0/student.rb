# 目前只实现了随机生成100个学生信息，基本实现了查找，修改，新增功能
# -*- coding: UTF-8 -*-
#定义学生类
class Student
   # 初始化类变量,用于记录实际学生的个数
   @@count = 0
   #构造函数
   def initialize(i,n,g,a)
      # 实例变量赋值
      @id, @name, @gendar, @age = i, n, g, a
      #类变量自加
      @@count += 1
   end
   # 访问器方法,以便查询
   def getId
      @id
   end
   def getName
       @name
   end
   # 设置器方法，以便更改操作
   def setId=(value)
      @id = value
   end
   def setName=(value)
       @name = value
   end
   def setGendar=(value)
       @gendar = value
   end
   def setAge=(value)
       @age = value
   end
   #输出学生的所有信息
   def display_details()
       puts  "Student id: #@id"
       puts  "Student name:#@name"
       puts  "Student gendar:#@gendar"
       puts  "Student age:#@age"
   end

   def printCount()
      puts  "Total number of customers: #@@count"
   end
end
#方法一，随机产生长度为len的字符串，这里定义len为rand(15)
def newpass( len )
    chars = ("a".."z").to_a + ("A".."Z").to_a 
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
end
#生成100个学生信息
$student=Array.new
j = 0
while j < 100 do
   i = j + 1
   n=newpass(rand(15))             #名字通过调用方法一随机产生长度为0-15的字母名
   if  n.length > 8                        #性别通过名字的长度赋值，若长度大于8则为男性，反之为女性
     g='M'
   else 
     g='W'
   end
   a=rand(7) + 14                            #得到的14<a<21
   $student[j]=Student.new(i,n,g,a)
    j += 1
end
#输出前三个查看生成的信息是否成功(通过测试是成功的)
k = 0
begin
   puts  "The #{k + 1}student information :"
   $student[k].display_details()
   k +=1
end while k < 3
#主函数，选择功能
while true
   puts "1.search student"
   puts  "2.change information"
   puts  "3.add student"
   puts  "4.exit"
   puts  "please input i:"
   i=gets
   case i
   when 1
       puts "please input id or name:"
       id_name = gets
       i=0
       while !$student[i] = null
           if($student[i].getId()==i ) || ($student[i].getName().equals i )
              puts "$student[i].display_details()"              #找到学生，输出信息
           end
           i += 1
       end
       puts "not find the student"                                 #没有找到此学生
   when 2
       puts "please input id or name:"
       id_name = gets
       i=0
       while !$student[i] = null
           if($student[i].getId()==i )||( $student[i].getName().equals i )
              puts "please input the new id:"
              id = gets
              $student[i].setId(id)
              puts  please input the new name"
              name = gets
              $student[i].setName(name)
              puts  please input the new gendar"
              gendar = gets
              $student[i].setGendar(gendar)
              puts  please input the new age"
              age = gets
              $student[i].setAge(age)
           end
           i += 1
       end
       puts 'not find the student!'
   when 3
       puts '输入新生的学号:'
       id = gets
       puts '输入新生的姓名:'
       name = gets
       puts '输入新生的性别: '
       gendar = gets
       puts '输入新生的年龄：'
       age  =  gets
       num = $student.length
       $student[num] = Student.new(id,name,gendar,age)
   when 4
       break
   else 
       puts '输入错误'
   end
end
