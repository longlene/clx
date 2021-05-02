# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Slide Show (S9) - Write Your Slides in Plain Text w/ Formatting Conventions - A Free Web Alternative to PowerPoint and Keynote"
HOMEPAGE="https://github.com/slideshow-s9/slideshow"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/slideshow-models-4.0.0"
ruby_add_rdepend ">=dev-ruby/gli-2.13.4"
