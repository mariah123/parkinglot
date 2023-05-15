using AutoMapper;
using ParkingLotManagement.Application.Dtos;
using ParkingLotManagement.Domain.Entities;
using ParkingLotManagement.Infrastructure.Dtos;

namespace ParkingLotManagement.Application.Automapper;
public class ParkingLotProfile: Profile
{
    public ParkingLotProfile()
    {
        CreateMap<ParkingLotDetail, ParkingLot>();
        CreateMap<VehicalResponse, Vehical>();
        CreateMap<GetStatisticsResponse, GetStatisticsQueryResponse>();
    }
    
}
