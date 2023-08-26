using EKOMARKET.HANGFIRE;
using Hangfire;
using Hangfire.PostgreSql;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddHangfire(x => x.UsePostgreSqlStorage(@"Host=localhost;Database=ekomarket;Username=postgres;Password=root"));
builder.Services.AddHangfireServer();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseHangfireDashboard(); 

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

RecurringJobs.DatabaseBackupOperation();

app.Run();
