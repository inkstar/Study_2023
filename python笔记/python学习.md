### python3函数之匿名函数- lambda函数

#### lambda 函数的定义&格式

lambda 函数编写简短的、一次性的函数

```python
lambda arguments: expression
```

其中，arguments 是函数的参数，expression 是函数的返回值。lambda 函数可以有多个参数，参数之间用逗号分隔。

**<u>参数：表达式</u>**

#### lambda 函数的例子：

1. 计算平方数

```pyth
f = lambda x: x**2
print(f(3))  # 输出 9
```

2. 判断奇偶数

```python
f = lambda x: '偶数' if x % 2 == 0 else '奇数'
print(f(3))  # 输出 '奇数'
print(f(4))  # 输出 '偶数'
```

3. 对列表进行排序

```python
lst = [(1, 2), (3, 1), (2, 3)]
lst.sort(key=lambda x: x[1])
print(lst)  # 输出 [(3, 1), (1, 2), (2, 3)]
```

4. 将字符串转换为大写

```python
lst = ['hello', 'world', 'python']
lst = list(map(lambda x: x.upper(), lst))
print(lst)  # 输出 ['HELLO', 'WORLD', 'PYTHON']
```

需要注意的是，lambda 函数通常用于编写简短的、一次性的函数，如果函数比较复杂，建议使用普通的函数来实现。另外，lambda 函数也有一些限制，例如不能包含多条语句、不能使用循环或者异常处理等。

### python 数据结构之列表

**我不熟悉的	**

|        方法        |                             描述                             |
| :----------------: | :----------------------------------------------------------: |
|   list.append(x)   |    把一个元素添加到列表的结尾，相当于 a[len(a):] = [x]。     |
| **list.extend(L)** | **通过添加指定列表的所有元素来扩充列表，相当于 a[len(a):] = L。** |
| list.insert(i, x)  | 在指定位置插入一个元素。第一个参数是准备插入到其前面的那个元素的索引，例如 a.insert(0, x) 会插入到整个列表之前，而 a.insert(len(a), x) 相当于 a.append(x) 。 |
|   list.remove(x)   | 删除列表中值为 x 的第一个元素。如果没有这样的元素，就会返回一个错误。 |
|   list.pop([i])    | 从列表的指定位置移除元素，并将其返回。如果没有指定索引，a.pop()返回最后一个元素。元素随即从列表中被移除。（方法中 i 两边的方括号表示这个参数是可选的，而不是要求你输入一对方括号，你会经常在 Python 库参考手册中遇到这样的标记。） |
|    list.clear()    |              移除列表中的所有项，等于del a[:]。              |
|   list.index(x)    | 返回列表中第一个值为 x 的元素的索引。如果没有匹配的元素就会返回一个错误。 |
|   list.count(x)    |                 返回 x 在列表中出现的次数。                  |
|    list.sort()     |                   对列表中的元素进行排序。                   |
|   list.reverse()   |                      倒排列表中的元素。                      |
|  **list.copy()**   |               **返回列表的浅复制，等于a[:]。**               |

#### 将列表当做堆栈使用

列表方法使得列表可以很方便的作为一个堆栈来使用，堆栈作为特定的数据结构，最先进入的元素最后一个被释放（后进先出）。用 append() 方法可以把一个元素添加到堆栈顶。用不指定索引的 pop() 方法可以把一个元素从堆栈顶释放出来。

以下是一些常用的列表函数，可以用于实现堆栈的基本操作：

1. append(item)：将元素添加到列表的末尾，相当于入栈操作。
2. pop()：从列表的末尾删除元素，并返回删除的元素，相当于出栈操作。
3. len()：返回列表中元素的个数，可以用于判断堆栈是否为空。
4. [-1]：访问列表中的最后一个元素，可以用于查看堆栈顶部的元素。

例如：

```python
stack = []
stack.append(1)  # 入栈操作
stack.append(2)
stack.append(3)
print(stack)  # 输出 [1, 2, 3]

top = stack[-1]  # 查看堆栈顶部的元素
print(top)  # 输出 3

item = stack.pop()  # 出栈操作
print(item)  # 输出 3
print(stack)  # 输出 [1, 2]
```

虽然列表可以模拟堆栈的行为，但是列表的插入和删除操作的时间复杂度为 O(n)，而堆栈的插入和删除操作的时间复杂度应该为 O(1)。如果需要实现高效的堆栈操作，建议使用 Python 中的 collections.deque 类型，它可以实现高效的堆栈操作。

#### 将列表当作队列使用

在 Python 中，可以使用列表来模拟队列的行为，将列表当作队列使用。以下是一些常用的列表函数，可以用于实现队列的基本操作：

1. `append()`：在列表的末尾添加元素，相当于入队操作。

2. `pop(0)`：从列表的开头删除元素，并返回删除的元素，相当于出队操作。

3. `len()`：返回列表中元素的个数，可以用于判断队列是否为空。

4. `[0]`：访问列表中的第一个元素，可以用于查看队列头部的元素。

以下是一个使用列表模拟队列的例子：

```python
queue = []
queue.append(1)  # 入队操作
queue.append(2)
queue[0]  # 查看队列头部的元素
print(top)  # 输出 1

item = queue.pop(0)  # 出队操作
print(item)  # 输出 1
print(queue)  # 输出 [2]
```

需要注意的是，虽然列表可以模拟队列的行为，但是列表的插入和删除操作的时间复杂度为 O(n)，而队列的插入和删除操作的时间复杂度应该为 O(1)。如果需要实现高效的队列操作，建议使用 Python 中的 `collections.deque` 类型，它可以实现高效的队列操作。

#### 使用deque 双端队列实现 栈和队列

以下是使用 `deque` 类型实现队列和栈的示例代码，注释中有详细的解释：

```python
from collections import deque

# 使用 deque 类型实现队列
class Queue:
    def __init__(self):
        self.items = deque()  # 创建一个空的 deque 对象

    def is_empty(self):
        return len(self.items) == 0  # 判断队列是否为空

    def enqueue(self, item):
        self.items.append(item)  # 在队列的右侧插入元素

    def dequeue(self):
        if self.is_empty():
            raise Exception('Queue is empty')  # 如果队列为空，则抛出异常
        return self.items.popleft()  # 从队列的左侧删除元素，并返回删除的元素

    def size(self):
        return len(self.items)  # 获取队列中元素的个数

# 使用 deque 类型实现栈
class Stack:
    def __init__(self):
        self.items = deque()  # 创建一个空的 deque 对象

    def is_empty(self):
        return len(self.items) == 0  # 判断栈是否为空

    def push(self, item):
        self.items.append(item)  # 在栈的右侧插入元素

    def pop(self):
        if self.is_empty():
            raise Exception('Stack is empty')  # 如果栈为空，则抛出异常
        return self.items.pop()  # 从栈的右侧删除元素，并返回删除的元素

    def size(self):
        return len(self.items)  # 获取栈中元素的个数
```

在上面的代码中，我们使用 `deque` 类型分别实现了队列和栈。在队列的实现中，我们使用 `popleft()` 方法从队列的左侧删除元素，从而实现了先进先出的队列操作。在栈的实现中，我们使用 `pop()` 方法从栈的右侧删除元素，从而实现了后进先出的栈操作。需要注意的是，我们在队列和栈的实现中，都使用了 `deque` 类型的 `is_empty()`、`size()` 方法，这些方法可以用于判断队列或栈是否为空，以及获取队列或栈中元素的个数。

好的，以下是使用 `Queue` 和 `Stack` 类实现一些常见的操作的示例代码：

```python
# 创建一个队列对象
q = Queue()

# 在队列中插入元素
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)

# 从队列中删除元素
print(q.dequeue())  # 输出 1
print(q.dequeue())  # 输出 2

# 获取队列中元素的个数
print(q.size())  # 输出 1

# 创建一个栈对象
s = Stack()

# 在栈中插入元素
s.push(1)
s.push(2)
s.push(3)

# 从栈中删除元素
print(s.pop())  # 输出 3
print(s.pop())  # 输出 2

# 获取栈中元素的个数
print(s.size())  # 输出 1
```

在上面的代码中，我们首先创建了一个 `Queue` 对象和一个 `Stack` 对象，然后分别使用 `enqueue()` 和 `push()` 方法向队列和栈中插入元素。接着，我们使用 `dequeue()` 和 `pop()` 方法从队列和栈中删除元素，并使用 `size()` 方法获取队列和栈中元素的个数。

需要注意的是，队列和栈的操作方式不同，队列是先进先出的，而栈是后进先出的。因此，在使用队列和栈时，需要根据具体的需求选择合适的数据结构。例如，如果需要实现一个先进先出的任务队列，就可以使用队列来实现；如果需要实现一个支持撤销操作的文本编辑器，就可以使用栈来实现。

##### 练习写队列

自己试着写一下队列：

```python
from collections import deque
# 定义一个 队列 的类
class Queue:
    def __init__(self):  # 要写成__init__而不是_init_
        # return self.items      #这么写不对，因为第一部分是定义一个queue
        self.items = deque()

    # def enqueue(self,items)    #按部就班，先判空，然后再是插入 删除 获取个数
    def is_empty(self):
        return len(self.items) == 0

    def enqueue(self, item):  # 队尾添加元素
        self.items.append(item)

    def dequeue(self):
        if (self.is_empty()):
            raise Exception('Queue is empty')  # 抛出异常
        return self.items.popleft()

    def size(self):
        return len(self.items)  # 获取队列长度


q = Queue()
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(100)
print(list(q.items)) # 输出 [1, 2, 3, 100]
print(q.dequeue())  # 输出 1
print(q.dequeue())  # 输出 2
print(q.size())     # 输出 2
print(q.dequeue())  # 输出 3
print(q.is_empty()) # 输出 False
print(q.dequeue())  # 输出 100
print(q.is_empty()) # 输出 True
print(list(q.items)) # 输出 []

```

在这个修正后的代码中，我们添加了一些`print`语句来演示如何使用`Queue`类。我们首先将一些元素添加到队列中，然后使用`list`函数打印整个队列对象。我们还使用`dequeue`方法逐个删除元素，并打印每个删除的元素。我们还使用`size`方法获取队列中剩余元素的数量，并使用`is_empty`方法检查队列是否为空。最后，我们再次使用`list`函数打印整个队列对象，以演示在删除所有元素后队列为空。

##### 练习写栈

```python
from collections import deque
class Stack:
    def __init__(self):
        self.items=deque()
    def is_empty(self):
        return len(self.items)==0
    def push(self,item):
        return self.items.append(item)
    def pop(self):
        if(self.is_empty()):
            raise Exception('Stack is empty')
        return self.items.pop()
    def size(self):
        return len(self.items)

q=Stack()
q.push(1)
q.push(2)
q.push(300)
q.push(4000)
print(q.pop())      # 输出 4000
print(list(q.items)) # 输出 [1, 2, 300]
print(q.is_empty()) # 输出 False
print(q.pop())      # 输出 300
q.pop()
print(q.size())     # 输出 1
q.pop()
print(q.is_empty()) # 输出 True
q.push(2)
print(list(q.items)) # 输出 [2]
```

#### 列表推导式

列表推导式是一种简洁的编程语法，用于快速创建列表。它的基本结构是在方括号内使用一个表达式来定义列表元素，然后使用一个for循环来迭代这个表达式。例如，以下代码使用列表推导式创建一个包含1到10的整数列表：

```python
my_list = [x for x in range(1, 11)]
```

这个代码等价于以下的for循环：

```python
my_list = []
for x in range(1, 11):
    my_list.append(x)
```

列表推导式可以更简洁地表达相同的逻辑，因此在编写代码时非常有用。它还可以使用条件语句来过滤列表元素，例如：

```python
my_list = [x for x in range(1, 11) if x % 2 == 0]
```

这个代码只会将偶数添加到列表中。列表推导式是一种非常强大的编程语法，可以帮助程序员更快地编写代码，并使代码更易于阅读和理解。

我们可以用 if 子句作为过滤器：

```python
>>> [3*x for x in vec if x > 3]
[12, 18]
>>> [3*x for x in vec if x < 2]
[]
```

### 遍历技巧

好的，以下是每种遍历技巧的文字解释、例子和运行结果：

1. 遍历列表

遍历列表是指按顺序访问列表中的每个元素。我们可以使用`for`循环来遍历列表。例如：

```python
fruits = ['apple', 'banana', 'cherry']
for fruit in fruits:
    print(fruit)
```

输出结果：

```
apple
banana
cherry
```

2. 遍历字典

遍历字典是指按顺序访问字典中的每个键值对。我们可以使用`items()`方法来同时获取键和值。例如：

```python
knights = {'gallahad': 'the pure', 'robin': 'the brave'}
for k, v in knights.items():
    print(k, v)
```

输出结果：

```
gallahad the pure
robin the brave
```

3. 遍历序列并获取索引位置

遍历序列并获取索引位置是指按顺序访问序列中的每个元素，并获取它们在序列中的索引位置。我们可以使用`enumerate()`函数来同时获取索引位置和对应的值。例如：

```python
fruits = ['apple', 'banana', 'cherry']
for i, fruit in enumerate(fruits):
    print(i, fruit)
```

输出结果：

```
0 apple
1 banana
2 cherry
```

4. 同时遍历两个序列

同时遍历两个序列是指按顺序访问两个或多个序列中的每个元素。我们可以使用`zip()`函数将它们组合在一起。例如：

```python
questions = ['name', 'age', 'gender']
answers = ['Alice', '25', 'female']
for q, a in zip(questions, answers):
    print(f"What's your {q}? It's {a}.")
```

输出结果：

```
What's your name? It's Alice.
What's your age? It's 25.
What's your gender? It's female.
```

5. 反向遍历序列

反向遍历序列是指按相反的顺序访问序列中的每个元素。我们可以使用`reversed()`函数来反向遍历序列。例如：

```python
fruits = ['apple', 'banana', 'cherry']
for fruit in reversed(fruits):
    print(fruit)
```

输出结果：

```
cherry
banana
apple
```

6. 按顺序遍历序列

按顺序遍历序列是指按升序或降序访问序列中的每个元素。我们可以使用`sorted()`函数返回一个已排序的序列。例如：

```python
fruits = ['apple', 'banana', 'cherry']
for fruit in sorted(fruits):
    print(fruit)
```

输出结果：

```
apple
banana
cherry
```

### python模块

#### 自定义模块

*这个说白了就是自己写一个程序，然后另一个程序引用这个程序里的函数*

如想要导入模块 support，需要把命令放在脚本的顶端：

```python
#!/usr/bin/python3
# Filename: support.py

def print_func( par ):
    print ("Hello : ", par)
    return
```

test.py 引入 support 模块：

```python
#!/usr/bin/python3
# Filename: test.py

# 导入模块
import support

# 现在可以调用模块里包含的函数了
support.print_func("Nowcoder")
```

以上实例输出结果：

```
$ python3 test.py 
Hello :  Nowcoder
```

#### 常用的标准库模块

当然，我很乐意为您提供更详细的示例。以下是每个模块的示例：

1. `os`模块：

```python
import os

# 获取当前工作目录
current_dir = os.getcwd()
print(current_dir)

# 创建一个名为"new_folder"的目录
os.mkdir("new_folder")

# 删除名为"new_folder"的目录
os.rmdir("new_folder")
```

2. `sys`模块：

```python
import sys

# 获取命令行参数
args = sys.argv
print(args)

# 退出程序
sys.exit()
```

3. `math`模块：

```python
import math

# 计算正弦值
sin_value = math.sin(0.5)
print(sin_value)

# 计算自然对数
log_value = math.log(10)
print(log_value)
```

4. `random`模块：

```python
import random

# 生成随机整数
rand_int = random.randint(1, 10)
print(rand_int)

# 生成随机浮点数
rand_float = random.uniform(0, 1)
print(rand_float)
```

5. `datetime`模块：

```python
import datetime

# 获取当前日期和时间
now = datetime.datetime.now()
print(now)

# 计算日期差
date1 = datetime.date(2023, 5, 1)
date2 = datetime.date(2023, 5, 4)
delta = date2 - date1
print(delta.days)
```

6. `re`模块：

```python
import re

# 匹配字符串中的数字
text = "abc123def456"
pattern = "\d+"
match = re.search(pattern, text)
print(match.group(0))

# 替换字符串中的数字
new_text = re.sub(pattern, "X", text)
print(new_text)
```

7. `json`模块：

```python
import json

# 将Python对象转换为JSON格式
data = {"name": "Alice", "age": 25}
json_data = json.dumps(data)
print(json_data)

# 将JSON格式转换为Python对象
new_data = json.loads(json_data)
print(new_data)
```

8. `csv`模块：

```python
import csv

# 读取CSV文件
with open("data.csv", "r") as file:
    reader = csv.reader(file)
    for row in reader:
        print(row)

# 写入CSV文件
with open("output.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["name", "age"])
    writer.writerow(["Alice", 25])
    writer.writerow(["Bob", 30])
```

#### python模块常用语句

当我们在Python中使用模块时，通常需要使用一些常用的语句来导入和使用模块。以下是一些常用的Python模块语句，并且我会附上运行结果：

1. `import`语句：用于导入一个模块或其中的一个或多个函数、类或变量。例如：

```python
import os
print(os.getcwd())
```

输出：

```
/Users/username
```

2. `as`语句：用于给导入的模块或其中的函数、类或变量指定别名。例如：

```python
import numpy as np
print(np.array([1, 2, 3]))
```

输出：

```
[1 2 3]
```

3. `from`语句：用于从一个模块中导入一个或多个函数、类或变量。例如：

```python
from random import randint, uniform
print(randint(1, 10))
print(uniform(0, 1))
```

输出：

```
6
0.12345678901234567
```

4. `if __name__ == "__main__"`语句：用于判断当前模块是否是主程序，如果是则执行一些特定的代码。例如：

```python
if __name__ == "__main__":
    print("This is the main program.")
```

输出：

```
This is the main program.
```

5. `dir()`函数：用于列出一个模块中定义的所有函数、类和变量。例如：

```python
import os
print(dir(os))
```

输出：

```
['DirEntry', 'F_OK', 'MutableMapping', 'O_APPEND', 'O_BINARY', 'O_CREAT', 'O_EXCL', 'O_NOINHERIT', 'O_RANDOM', 'O_RDONLY', 'O_RDWR', 'O_SEQUENTIAL', 'O_SHORT_LIVED', 'O_TEMPORARY', 'O_TEXT', 'O_TRUNC', 'O_WRONLY', 'PathLike', 'R_OK', 'SEEK_CUR', 'SEEK_E...]
```

6. `help()`函数：用于获取一个模块或其中的函数、类或变量的帮助文档。例如：

```python
import math
help(math.sin)
```

输出：

```
Help on built-in function sin in module math:

sin(x, /)
    Return the sine of x (measured in radians).

    The sine function is defined as sin(x) = x - x^3/3! + x^5/5! - x^7/7! + ...

    Example:
    >>> sin(math.pi/2)
    1.0
```

#### 两种导入方式的差异

在Python中，我们可以使用`from modname import *`和`import modname`两种方式来导入模块。它们之间的区别如下：

1. `from modname import *`语句会将模块中所有的函数、类和变量都导入到当前命名空间中，这样可以方便地使用模块中的所有内容。但是，这种方式可能会导致命名空间污染，因为可能会导入一些不需要的内容，而且可能会与当前命名空间中的其他内容发生冲突。

2. `import modname`语句只会将模块名导入到当前命名空间中，这样我们就可以使用模块中的函数、类和变量，但是需要使用模块名作为前缀。这种方式可以避免命名空间污染，因为只有模块名被导入到当前命名空间中。

因此，通常情况下，我们建议使用`import modname`的方式来导入模块，这样可以避免命名空间污染，并且可以更好地控制模块中的内容。但是，在某些情况下，如果我们需要频繁地使用模块中的许多函数、类和变量，那么使用`from modname import *`可能会更方便。但是，我们需要注意避免与当前命名空间中的其他内容发生冲突。

### Python3 输入和输出

如果你希望将输出的值转成字符串，可以使用 repr() 或 str() 函数来实现。

- **str()：** 函数返回一个*用户易读*的表达形式，以便用户可以轻松地阅读和理解它们。返回一个对象的易读*字符串表示形式*，通常用于向用户显示信息。
- **repr()：** 产生一个*解释器易读*的表达形式，用于调试和开发，以便开发人员可以查看对象的内部表示形式。它的输出应该是一个有效的*Python表达式*，可以用来重新创建该对象。

下面是一个例子，展示了repr()和str()函数的输出不同的情况：

```python
import datetime

# 创建一个datetime对象
d = datetime.datetime.now()

# 使用repr()函数输出
print(repr(d))  # 输出：datetime.datetime(2023, 5, 6, 16, 30, 45, 123456)

# 使用str()函数输出
print(str(d))   # 输出：2023-05-06 16:30:45.123456
```











