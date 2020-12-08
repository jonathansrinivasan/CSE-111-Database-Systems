# Lab-3

\noindent
In this lab session you have to write 15 SQL queries for the TPCH database created and populated in the previous labs. The queries are the following (1 point per query):

\begin{enumerate}
\item What is the address, phone number, and account balance of \texttt{Customer\#000000127}?

\item What is the largest account balance of a supplier?

\item Find all the items with the return flag set to \texttt{R} on the receipt date of \texttt{May 30, 1992}.

\item What is the average completion time in number of days (from commit date to ship date) for an order for which ship date is larger than or equal to commit date? Check the \texttt{julianday} function from \texttt{SQLite}.

\item What is the minimum, maximum, average, and total account balance among the customers in each market segment? Sort the results in decreasing order of the total account balance.

\item What are the countries of customers who ordered items between \texttt{March 10-12, 1995}?

\item What is the receipt date and the total number of ordered items per receipt date by \texttt{Customer\#000000106}?

\item Find the name of the suppliers from \texttt{ASIA} who have less than \texttt{\$1000} on account balance.

\item Find the minimum account balance of the suppliers from countries with less than 3 suppliers. Print the country and the minimum account balance.

\item Find the total price of orders made by customers from \texttt{EUROPE} in 1996.

\item Find the customers that received at least a \texttt{5\%} discount for at least \texttt{70} items. Print the \texttt{custkey} and the number of discounted items.

\item Find the number of orders having status \texttt{F} for each customer region and display them in descending order. Print the region name and the number of status \texttt{F} orders.

\item Find the average account balance of all the customers from \texttt{AFRICA} in the \texttt{MACHINERY} market segment.

\item Find how many \texttt{1-URGENT} priority orders have been posted by customers from \texttt{France} between 1994 and 1996, combined.

\item Find the total number of \texttt{1-URGENT} priority orders supplied by suppliers in each region each year (from \texttt{o\_orderdate}). Print the year, region name, and the count sorted by the year then the region in increasing order. Check the \texttt{substr} function in \texttt{SQLite}.

\end{enumerate}


\noindent
In order to complete the lab you have to perform the following tasks:
\begin{enumerate}
\item Log in to your GitLab account.

\item Explore the folders and files in the Lab 3 repo.

\item Create a merge request for the \texttt{Instructions} issue. This is done from the \texttt{Issues} tab. The result of the merge request is a new branch that copies the files from \texttt{master}.

\item Clone the repo to your local machine or the remote lab machine. You can choose to directly clone the branch for the merge request, or the \texttt{master} and then checkout the merge request branch.

\item Write the \texttt{SQL} statement corresponding to each query in the file \texttt{test/x.sql}, where \texttt{x} is the number of the query above. Each query goes into its separate file. These are the only files you have to modify and commit in this assignment.
\label{step-code}

\item You can check the correctness of your queries by executing the command \texttt{make run} in the terminal. You have to be in the main lab folder. The expected output is available in \texttt{results/x.res}, where \texttt{x} is the number of the query. The output produced by your code is available in \texttt{output/x.out}. They have to match for every query, e.g., \texttt{1.res} has to match with \texttt{1.out}.

\item Commit the changes to the query files and then push to the GitLab server.

\item Check the output of the pipeline under the \texttt{CI / CD} tab to see if your push has passed all the tests.

\item In case there are any errors, repeat the process from step~\ref{step-code}.
\end{enumerate}

\noindent
The score for the lab is assigned based on passing the test cases and the commit/push history. The instructor and the TAs have access to the GitLab repos.
