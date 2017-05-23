# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Search or browse the names, descriptions and image URLs for various categories including: Asterism, Celestial Object, Star, Planet, Star System, Galaxy, Moon, Comet, Asteroid, Constellation, Nebula, Astronomical Discovery, Cluster and Meteor Shower"
HOMEPAGE="https://github.com/nick-aschenbach/astronomy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"

