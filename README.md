# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 <p class="card-text"><%= pluralize(user.categories.count, "article") %></p>

 <strong> Дата приёма: </strong><%= link_to appointment.data, appointment_path(appointment), class: "badge badge-pill badge-info mr-1" %>
            <strong> Описание проблемы: </strong><%= link_to appointment.content, appointment_path(appointment), class: "badge badge-pill badge-info mr-1" %>
            <strong> Patient: </strong><%= link_to appointment.user_id, user_path(User.find(appointment.user_id)), class: "badge badge-pill badge-info mr-1" %>
            <% appointment.doctors.each do |doctor| %>
                <strong> Phisician: </strong><%= link_to doctor.name, doctor_path(doctor), class: "badge badge-pill badge-info mr-1" %>
            <% end %># clinicans
