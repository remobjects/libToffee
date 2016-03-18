<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" DefaultTargets="Build" ToolsVersion="4.0">
    <PropertyGroup>
        <RootNamespace>RemObjects.Elements.System</RootNamespace>
        <ProjectGuid>AB0D5693-F617-4EBB-821E-ED5F46CE6FF0</ProjectGuid>
        <OutputType>StaticLibrary</OutputType>
        <AssemblyName>Nougat</AssemblyName>
        <AllowLegacyOutParams>False</AllowLegacyOutParams>
        <AllowLegacyCreate>False</AllowLegacyCreate>
        <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
        <SDK>watchOS</SDK>
        <CreateHeaderFile>True</CreateHeaderFile>
        <Name>libNougat (watchOS)</Name>
        <GenerateDebugInfo>True</GenerateDebugInfo>
        <Architecture>armv7k</Architecture>
        <SimulatorArchitectures>i386</SimulatorArchitectures>
        <DeploymentTargetVersion>2.0</DeploymentTargetVersion>
        <DefineConstants>WATCHOS</DefineConstants>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
        <Optimize>false</Optimize>
        <OutputPath>.\bin\Debug</OutputPath>
        <EnableAsserts>True</EnableAsserts>
        <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
        <CaptureConsoleOutput>False</CaptureConsoleOutput>
        <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
        <Optimize>true</Optimize>
        <OutputPath>.\bin\Release</OutputPath>
        <EnableAsserts>False</EnableAsserts>
        <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
        <CaptureConsoleOutput>False</CaptureConsoleOutput>
        <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
        <GenerateBitcode>True</GenerateBitcode>
    </PropertyGroup>
    <ItemGroup>
        <Reference Include="Foundation"/>
        <Reference Include="rtl"/>
    </ItemGroup>
    <ItemGroup/>
    <ItemGroup/>
    <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Elements\RemObjects.Elements.Nougat.targets"/>
    <PropertyGroup>
        <PreBuildEvent/>
    </PropertyGroup>
    <Import Project="libNougat-Shared.projitems" Label="Shared"/>
</Project>