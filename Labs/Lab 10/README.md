In this lab, you will learn how to work with triggers in SQLite. In order to complete the requirements, you have to implement the following tasks:

\begin{enumerate}
\item Create a trigger \texttt{t1} that for every new {\tt order} entry automatically fills the {\tt o\_orderdate} attribute with the date \texttt{2020-12-01}. Insert into \texttt{orders} all the orders from \texttt{November 1995}, paying close attention on how the {\tt o\_orderkey} attribute is set. Write a query that returns the number of orders from \texttt{2020}. Put all the three SQL statements in file \texttt{test/1.sql}. (\textbf{3 points})

\item Create a trigger \texttt{t2} that sets a warning \texttt{Negative balance!!!} in the comment attribute of the {\tt customer} table every time {\tt c\_acctbal} is updated to a negative value from a positive one. Write a SQL statement that sets the balance to \texttt{-100} for all the customers in \texttt{EUROPE}. Write a query that returns the number of customers with negative balance from \texttt{FRANCE}. Put all the SQL statements in file \texttt{test/2.sql}. (\textbf{3 points})

\item Create a trigger \texttt{t3} that resets the comment to \texttt{Positive balance} if the balance goes back positive from negative. Write a SQL statement that sets the balance to \texttt{100} for all the customers in \texttt{ROMANIA}. Write a query that returns the number of customers with negative balance from \texttt{EUROPE}. Put all the SQL statements in file \texttt{test/3.sql}. (\textbf{3 points})

\item Create triggers that update the attribute {\tt o\_orderpriority} to \texttt{HIGH} every time a new {\tt lineitem} tuple is added to or deleted from that order. Delete all the line items corresponding to orders from \texttt{November 1996}. Write a query that returns the number of \texttt{HIGH} priority orders in the fourth trimester of \texttt{1996}. Put all the SQL statements in file \texttt{test/4.sql}. (\textbf{3 points})

\item Create a trigger \texttt{t5} that removes all the tuples from \texttt{partsupp} and \texttt{lineitem} corresponding to a part being deleted. Delete all the parts supplied by suppliers from \texttt{FRANCE} or \texttt{GERMANY}. Write a query that returns the number of parts supplied by every supplier in \texttt{EUROPE} grouped by their country in increasing order. Put all the SQL statements in file \texttt{test/5.sql}. (\textbf{3 points})
\end{enumerate}


In order to complete the lab you have to perform the following tasks:
\begin{enumerate}
\item Log in to your GitLab account.

\item Explore the folders and files in the Lab 10 repo.

\item Create a merge request for the \texttt{Instructions} issue. This is done from the \texttt{Issues} tab. The result of the merge request is a new branch that copies the files from \texttt{master}.

\item Clone the repo to your local machine or the remote lab machine. You can choose to directly clone the branch for the merge request, or the \texttt{master} and then checkout the merge request branch.

\item Implement the lab requirements in the files under the \texttt{test} folder.

\item You can check the correctness of your implementations by executing the command \texttt{make run} in the terminal. You have to be in the main lab folder. The expected output is available in \texttt{results/x.res}, where \texttt{x} is the number of the query. The output produced by your code is available in \texttt{output/x.out}. They have to match exactly for every query, e.g., \texttt{1.res} has to match with \texttt{1.out}.

\item Commit the changes to the \texttt{create-index.sql} file and then push to the \texttt{GitLab} server.

\item Check the output of the pipeline under the \texttt{CI / CD} tab to see if your push has passed all the tests.
\end{enumerate}


The score for the lab is assigned based on passing the test cases and the commit/push history. The instructor and the TAs have access to the \texttt{GitLab} repos.
