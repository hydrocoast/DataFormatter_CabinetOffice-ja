program main
    implicit none
    character*128 :: tmpchar
    character*128 :: filename_in, filename_out
    integer :: nx,ny
    real*8, allocatable :: data(:,:)

    ! arg check
    if (iargc() /= 4) then
        write(*,*) "ERROR: invalid number of arguments"
        stop
    endif

    ! filename
    call getarg(1,filename_in)
    call getarg(2,filename_out)
    write(*,*) '    IN  = ', trim(filename_in)
    write(*,*) '    OUT = ', trim(filename_out)

    ! nx and ny
    call getarg(3,tmpchar)
    read(tmpchar,'(I5)') nx
    call getarg(4,tmpchar)
    read(tmpchar,'(I5)') ny
    ! allocation
    allocate(data(ny,nx))

    ! read
    call formatter(trim(filename_in), nx, ny, data)
    ! write
    call write_matrix(trim(filename_out), nx, ny, -data)

end program main
