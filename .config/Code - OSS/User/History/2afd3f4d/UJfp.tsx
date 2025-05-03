import TopNavLink from "@/Components/TopNavLink";
import { Head } from "@inertiajs/react";

const Index = () => {
    return (
        <>
            <Head title="Welcome!" />
            <nav className="flex items-center justify-between w-full">
                <a href="">Typio</a>
                <div className="w-full h-32 flex items-center gap-12 px-12">
                    <TopNavLink name="Home" />
                    <TopNavLink name="Login" />
                    <TopNavLink name="Join Today" className="rounded py-2 px-4 bg-[#8DECB4] text-[#141E46] hover:opacity-80 transition-opacity" />
                </div>
            </nav>
        </>
    );
}


export default Index;
