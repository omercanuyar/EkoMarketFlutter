using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace EKOMARKET.Models;

public partial class EkomarketContext : DbContext
{
    public EkomarketContext()
    {
    }

    public EkomarketContext(DbContextOptions<EkomarketContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Market> Markets { get; set; }

    public virtual DbSet<Marketproduct> Marketproducts { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)

        => optionsBuilder.UseNpgsql("Host=localhost;Database=ekomarket;Username=postgres;Password=root");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("categories_pkey");

            entity.ToTable("categories");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Imageurl)
                .HasColumnType("character varying")
                .HasColumnName("imageurl");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Market>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("markets_pkey");

            entity.ToTable("markets");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Latitude).HasColumnName("latitude");
            entity.Property(e => e.Longitude).HasColumnName("longitude");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Marketproduct>(entity =>
        {
            entity.HasKey(e => new { e.Marketid, e.Productid }).HasName("marketproduct_pkey");

            entity.ToTable("marketproduct");

            entity.Property(e => e.Marketid).HasColumnName("marketid");
            entity.Property(e => e.Productid).HasColumnName("productid");
            entity.Property(e => e.Price).HasColumnName("price");

            entity.HasOne(d => d.Market).WithMany(p => p.Marketproducts)
                .HasForeignKey(d => d.Marketid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("marketproduct_marketid_fkey");

            entity.HasOne(d => d.Product).WithMany(p => p.Marketproducts)
                .HasForeignKey(d => d.Productid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("marketproduct_productid_fkey");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("products_pkey");

            entity.ToTable("products");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Explanation)
                .HasMaxLength(255)
                .HasColumnName("explanation");
            entity.Property(e => e.Imageurl)
                .HasMaxLength(255)
                .HasColumnName("imageurl");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");

            entity.HasMany(d => d.Categories).WithMany(p => p.Products)
                .UsingEntity<Dictionary<string, object>>(
                    "Productcategory",
                    r => r.HasOne<Category>().WithMany()
                        .HasForeignKey("Categoryid")
                        .HasConstraintName("productcategories_categoryid_fkey"),
                    l => l.HasOne<Product>().WithMany()
                        .HasForeignKey("Productid")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("productcategories_productid_fkey"),
                    j =>
                    {
                        j.HasKey("Productid", "Categoryid").HasName("productcategories_pkey");
                        j.ToTable("productcategories");
                        j.IndexerProperty<int>("Productid").HasColumnName("productid");
                        j.IndexerProperty<int>("Categoryid").HasColumnName("categoryid");
                    });
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
