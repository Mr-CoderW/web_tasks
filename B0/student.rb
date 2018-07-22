=begin
代码说明
1.已经实现将学生信息写入文档中；
2.相应的查找学生，修改学生信息，新增学生功能以实现；
缺点：
3.每次还是会生成100个学生信息，但是如果student.txt文件已存在，则不会更新到文件中；
4.由于不会文件的读写，所以查找信息存在问题；
5.主函数（在c语言的称呼，不知道在ruby中称为啥）是用来选择功能，试过case和if判断两种方式选择，
但是不论输入的数字是什么，选择语句总是执行最后一句话（此代码为“输入的数字错误”），这个问题
不知道如何解决
=end

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
  #输出总人数
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
#若文件不存在或者文件内容为空,将创建的信息输入到student.txt文件中.
if (File.exist?("student.txt")!= true)||(File.size("student.txt")== 0)
  aFile = File.new("student.txt", "a+")
  if aFile
   aFile.syswrite("#{$student}")
  else
    puts "Unable to open file!"
  end
end
#输出前三个查看生成的信息是否成功(通过测试是成功的)
k = 0
begin
   puts  "The #{k + 1}student information :"
   $student[k].display_details()
   k +=1
end while k < 3
#查询功能
def searchStudent
    puts "please input id or name:"
        id_name = gets
        i=0
        while !$student[i] = null
             if($student[i].getId()==i ) || ($student[i].getName().equals i )
               puts "$student[i].display_details()"              #找到学生，输出信息
            end
            i += 1
        end
        puts "not find the student" 
end
#修改信息功能
def alterStudent
    puts "please input id or name:"
    id_name = gets
    i=0
    while !$student[i] = null
         if($student[i].getId()== id_name )||( $student[i].getName().equals id_name )
           puts "please input the new id:"
           id = gets
           $student[i].setId(id)
           puts  "please input the new name"
           name = gets
           $student[i].setName(name)
           puts  "please input the new gendar"
           gendar = gets
           $student[i].setGendar(gendar)
           puts  "please input the new age"
           age = gets
           $student[i].setAge(age)
        end
        i += 1
    end
        puts 'not find the student!'
end
#添加功能
def addStudent
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
end
#主函数，选择功能,不知道为什么不论输入的数字为什么，总是输出“输入有误”
=begin
while true
    puts '1.search student'
    puts  '2.change information'
    puts  '3.add student'
    puts  '4.exit'
    puts  'please input i:'
    i=gets
    if i==1
         searchStudent
    elsif i==2
         alterStudent
    elsif i==3
         addStudent
    elsif i==4
         break
    else 
       puts '输入错误'
    end
end
=end