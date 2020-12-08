\noindent
In this lab session you have to write 15 SQL queries for the TPCH database created and populated in the previous labs. The queries are the following (1 point per query):

\begin{enumerate}
\item Find the total price paid on orders by every customer from \texttt{RUSSIA} in \texttt{1996}. Print the customer name and the total price.

\item Find the number of suppliers from every country.

\item How many orders are made by customers in each country in \texttt{ASIA}?

\item How many parts with size below \texttt{30} does every supplier from \texttt{CHINA} offer? Print the name of the supplier and the number of parts.

\item Find the number of orders made by customers from \texttt{PERU} in 1996.

\item How many parts produced by every supplier in \texttt{AMERICA} are ordered at each priority? Print the supplier name, the order priority, and the number of orders.

\item How many orders do customers in every country in \texttt{EUROPE} have in each status? Print the country name, the order status, and the count.

\item Find the number of distinct orders completed in 1994 by the suppliers in every country. An order status of \texttt{F} stands for complete. Print only those countries for which the number of orders is larger than 300.

\item How many different order clerks did the suppliers in \texttt{CANADA} work with?

\item Find the average discount for every part having \texttt{PROMO} in its type.

\item Find the supplier with the largest account balance in every country. Print the country name, the supplier name, and the account balance.

\item What is the average account balance for the suppliers in every country?

\item How many items are supplied by suppliers in \texttt{ASIA} for orders made by customers in \texttt{ARGENTINA}?

\item List the total price of orders between any two regions, i.e., the suppliers are from one region and the customers are from another region.

\item How many distinct orders are between customers and suppliers with negative account balance?
\end{enumerate}


\noindent
In order to complete the lab you have to perform the following tasks:
\begin{enumerate}
\item Log in to your GitLab account.

\item Explore the folders and files in the Lab 4 repo.

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

