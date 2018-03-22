crumb :root do
  link "HOME", root_path
end

crumb :projects do
  link "PROJECTS", projects_path
end

crumb :project do |p|
  link p.title.upcase, p
   parent :projects
end

crumb :documents do
  link "DOCUMENTS", documents_path
end

crumb :document do |d|
  link d.title.upcase, d
   parent :documents
end

crumb :teams do
  link "TEAMS", teams_path
end

crumb :team do |t|
  link t.title.upcase, t
   parent :teams
end

