In this lab session, you will write a database application in \texttt{Java} or \texttt{Python}. This is achieved by passing \texttt{SQL} statements to the database for execution and processing the returned query results in the application. This separation in logic is necessary because the database has relatively limited functionality -- storing data and executing \texttt{SQL} statements -- while \texttt{Java} or \texttt{Python} are general programming languages with extensive libraries that implement diverse functions. While we provide you skeleton code both for \texttt{Java} (\texttt{Lab\_7.java}) and \texttt{Python} (\texttt{Lab\_7.py}), you have the freedom to choose which programming language you use. However, you have to completely implement the application in one of the two languages.

We present the lab requirements for \texttt{Java}---the same applies to \texttt{Python}. You have to implement only the following methods/functions, which operate on the \texttt{TPC-H} database from the previous labs:

\begin{itemize}
\item \texttt{createTable} creates a table \texttt{warehouse} and adds it to the \texttt{TPC-H} database. Table \texttt{warehouse} stores data on the warehouses suppliers own and has the following schema/attributes:
	\begin{verbatim}
		w_warehousekey decimal(9,0) not null,
		w_name char(100) not null,
		w_capacity decimal(6,0) not null,
		w_suppkey decimal(9,0) not null,
		w_nationkey decimal(2,0) not null
	\end{verbatim}
\texttt{w\_warehousekey} is the unique identifier of the warehouse and has a numeric value. \texttt{w\_name} is the name of the warehouse, while \texttt{w\_capacity} is its capacity. \texttt{w\_suppkey} is the identifier of the supplier that owns the warehouse. A warehouse is owned by a single supplier, while a supplier can own multiple warehouses. \texttt{w\_nationkey} is the identifier of the nation where the warehouse is located. \texttt{w\_suppkey} and \texttt{w\_nationkey} take values from the corresponding attributes in tables \texttt{supplier} and \texttt{nation}, respectively.

\item \texttt{dropTable} drops/eliminates table \texttt{warehouse} together with all its data from the \texttt{TPC-H} database.

\item \texttt{populateTable} populates table \texttt{warehouse} with tuples corresponding to every supplier in the database. Two warehouses are created for every supplier. The nations where these warehouses are located are those that have the largest number of lineitems supplied by the supplier that are ordered by customers from that nation. In case of equality, the nations are sorted in alphabetical order and the first two are selected. The name of a warehouse is obtained by concatenating the supplier name with ``\texttt{\_\_\_}'' and with the name of the nation where the warehouse is located. In order to determine the capacity of a warehouse, you have to compute the total size of the parts (\texttt{p\_size}) supplied by the supplier to the customers in a nation. Then, the warehouse capacity is taken as the double of the maximum total part size across all the nations. The two warehouses owned by a supplier have the same capacity. Finally, the \texttt{w\_warehousekey} value is set as an increasing number that is unique across the tuples in the table.

\item \texttt{Q1} displays the entire content of the \texttt{warehouse} table sorted on \texttt{w\_warehousekey} by performing a \texttt{SQL} query. \textbf{(3 points)}

\item \texttt{Q2} computes the number of warehouses and the total capacity for the warehouses in every nation. The result is sorted in decreasing order of the number of warehouses and of the capacity, then alphabetical order of the nation name. \textbf{(3 points)}

\item \texttt{Q3} computes the suppliers that have a warehouse in a given nation taken as input parameter. The nation where warehouses are located is read from the input file \texttt{input/3.in}. \texttt{Q3} prints the name of the supplier, the nation of the supplier, and the name of the warehouse---sorted in alphabetical order by supplier name. \textbf{(3 points)}

\item \texttt{Q4} finds the warehouses from a given region that have capacity larger than a given threshold. The region name and the minimum capacity are parameters stored in the file \texttt{input/4.in}. \texttt{Q4} prints the warehouse name and its capacity in decreasing order of the capacity. \textbf{(3 points)}

\item \texttt{Q5} determines the total capacity of the warehouses belonging to suppliers from a given nation in every region. The suppliers' nation is a parameter stored in the file \texttt{input/5.in}. If there are no warehouses in a region, then value \texttt{0} is printed for that region. \texttt{Q5} prints the region and the capacity sorted alphabetically by region. \textbf{(3 points)}
\end{itemize}

In order to complete the lab you have to perform the following tasks:
\begin{enumerate}
\item Log in to your GitLab account.

\item Explore the folders and files in the Lab 7 repo.

\item Create a merge request for the \texttt{Instructions} issue. This is done from the \texttt{Issues} tab. The result of the merge request is a new branch that copies the files from \texttt{master}.

\item Clone the repo to your local machine or the remote lab machine. You can choose to directly clone the branch for the merge request, or the \texttt{master} and then checkout the merge request branch.

\item Write the \texttt{Java} code that implements the required functionality in the corresponding methods in file \texttt{Lab\_7.java}. If you use \texttt{Python}, you edit the file \texttt{Lab\_7.py}. This is the only file you have to edit. Moreover, you have to write code only in the methods/functions specified above.

\item You can check the correctness of your queries by executing the command \texttt{make run} in the terminal. You have to be in the main lab folder. The expected output is available in \texttt{results/x.res}, where \texttt{x} is the number of the query. The output produced by your code is available in \texttt{output/x.out}. They have to match exactly for every query, e.g., \texttt{1.res} has to match with \texttt{1.out}. For queries that require parameters, you can find their values in the files \texttt{input/x.in}.

\item Commit the changes to the code file and then push to the GitLab server.

\item Check the output of the pipeline under the \texttt{CI / CD} tab to see if your push has passed all the tests.
\end{enumerate}

The score for the lab is assigned based on passing the test cases and the commit/push history. The instructor and the TAs have access to the GitLab repos.

