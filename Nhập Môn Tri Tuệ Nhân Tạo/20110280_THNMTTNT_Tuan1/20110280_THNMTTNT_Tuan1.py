
from collections import defaultdict
from queue import Queue, PriorityQueue
class Graph:
    __n = 0
    __g =[[0 for a in range(50)] for x in range(50)]
    def __init__(self, a, b):
        self.__n = a
        self.__g = b
   


#doc du lieu tu file txt
def read_txt(file):
    size = int(file.readline())
    start, goal = [int(num) for num in file.readline().split(' ')]
    matrix = [[int(num)for num in line.split(' ')] for line in file]
    return size, start, goal, matrix
#chuyen ma tran thanh danh sach ke
def convert_graph(a):
    adj_list=defaultdict(list)
    for i in range (len(a)):
        for j in range(len(a[i])):
            if a[i][j]==1:
                adj_list[i].append(j)
    return adj_list


def covert_graph_weight(a):
    adj_list = defaultdict(list)
    for i in range (len(a)):
        for j in range(len(a[i])):
            if a[i][j]!=0:
                adj_list[i].append((j,a[i][j]))
    return adj_list


#Cai dat thuat toan BFS
def BFS(graph, start, end):
    visited = []
    frontier = Queue()

    #them node start vao frontier va vistied
    frontier.put(start)
    visited.append(start)
    #start khon co node cha
    parent = dict()
    parent[start] = None

    path_found = False

    while True:
        if frontier.empty():
            raise Exception("No way Exception")
        current_node = frontier.get()
        visited.append(current_node)

        #kiem tra current_node co la end hay khong
        if current_node == end:
            path_found = True
            break

        for node in graph[current_node]:
            if node not in visited:
                frontier.put(node)
                parent[node] = current_node
                visited.append(node)
    
    #xay dung duong di
    path = []
    if path_found:
        path.append(end)
        while parent[end] is not None:
            path.append(parent[end])
            end = parent[end]
        path.reverse()
    return path    
        
   
#--------------------------------------
#cai dat thuat toan DFS:
def DFS(graph, start, end):
    visited = []
    frontier = []
    #them node start vao frontier va visited
    frontier.append(start)
    visited.append(start)

    #start khong co node cha
    parent = dict()
    parent[start] = None


    path_found = False

    while True:
        if frontier == []:
            raise Exception("No way Exception")
        current_node = frontier.pop()
        visited.append(current_node)

        #kiem tra current_node co la end hay khong
        if current_node ==end:
            path_found = True
            break
        
        for node in graph[current_node]:
            if node not in visited:
                frontier.append(node)
                parent[node] = current_node
                visited.append(node)

    #xay dung duong di
    path = []
    if path_found:
        path.append(end)
        while parent[end] is not None:
            path.append(parent[end])
            end = parent[end]
        path.reverse()
    return path

#---------------------
def UCS(graph, start, end):

    visited = []
    frontier= PriorityQueue()
    #them node start vao frontier va visisted
    frontier.put((0,start))
    visited.append(start)
    # start khong co node cha
    parent = dict()
    parent[start] = None
    path_found = False
    while True:
        if frontier.empty():
            raise Exception("No way Exception")
        current_w,current_node = frontier.get()
        visited.append(current_node)

        #kiem tra current_node co la end hay khong
        if current_node == end:
            path_found = True
            break
        for nodei in graph[current_node]:
            node, weight = nodei
            if node not in visited:
                frontier.put((current_w + weight, node))
                parent[node] = current_node
                visited.append(node)
    # xay dung duong di
    path = []
    if path_found:
        path.append(end)
        while parent[end] is not None:
            path.append(parent[end])
            end = parent[end]
        path.reverse()
    return current_w, path
#--------------------

#---------------
if __name__ == "__main__":
    #doc file input.txt va input.txt
    file_1 = open("Input.txt","r")
    file_2 = open("InputUCS.txt","r")
    size_1, start_1,goal_1,matrix_1 = read_txt(file_1)
    size_2, start_2,goal_2,matrix_2 = read_txt(file_2)
    file_1.close()
    file_2.close()
    graph_1 = convert_graph(matrix_1)
    graph_2 = covert_graph_weight(matrix_2)

    # Thuc thu thua toan BFS
    result_bfs = BFS(graph_1,start_1,goal_1)
    print("kết quả sử dụng thuật toán BFS: \n",result_bfs)
    # Thực thi thuật toán DFS
    result_dfs = DFS(graph_1,start_1,goal_1)
    print("kết quả sử dụng thuật toán DFS: \n",result_dfs)
    # Thực thi thuật toán UCS
    cost, result_ucs = UCS(graph_2,start_2,goal_2)
    print("kết quả sử dụng thuật toán USC: \n",result_ucs, "với tổng chi phí là",cost)


 #------------------------------------   
 

