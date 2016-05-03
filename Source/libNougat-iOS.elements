<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" DefaultTargets="Build" ToolsVersion="4.0">
    <PropertyGroup>
        <RootNamespace>RemObjects.Elements.System</RootNamespace>
        <ProjectGuid>477EC1B1-0AA5-47D6-A4C3-EF8D5081190E</ProjectGuid>
        <OutputType>StaticLibrary</OutputType>
        <AssemblyName>Nougat</AssemblyName>
        <AllowLegacyOutParams>False</AllowLegacyOutParams>
        <AllowLegacyCreate>False</AllowLegacyCreate>
        <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
        <SDK>iOS</SDK>
        <CreateHeaderFile>True</CreateHeaderFile>
        <Name>libNougat (iOS)</Name>
        <GenerateDebugInfo>True</GenerateDebugInfo>
        <Architecture>arm64,armv7s,armv7</Architecture>
        <SimulatorArchitectures>x86_64,i386</SimulatorArchitectures>
        <DeploymentTargetVersion>7.0</DeploymentTargetVersion>
        <DefineConstants>IOS</DefineConstants>
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